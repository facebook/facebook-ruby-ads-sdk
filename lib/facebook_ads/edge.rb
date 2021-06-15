# Copyright (c) 2017-present, Facebook, Inc. All rights reserved.
#
# You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
# copy, modify, and distribute this software in source code or binary form for use
# in connection with the web services and APIs provided by Facebook.
#
# As with any software that integrates with the Facebook platform, your use of
# this software is subject to the Facebook Platform Policy
# [http://developers.facebook.com/policy/]. This copyright notice shall be
# included in all copies or substantial portions of the software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

module FacebookAds
  module EdgeHasGet
    include Enumerable

    extend Forwardable
    def_delegators :@collection, :length, :count

    DEFAULT_PAGE_SIZE = 10
    attr_accessor :has_next_page, :next_page_cursor

    def [](idx)
      # TODO Handle delegate
      fetch_next_page until idx < collection.length || !has_next_page?
      collection[idx]
    end

    def all
      fetch_next_page until !has_next_page?
      collection
    end

    def each
      return enum_for(:each) unless block_given?

      idx = 0

      while (e = self[idx])
        yield e
        idx += 1
      end

      self
    end

    def reload!
      @collection = Array.new
      self.has_next_page = true
      self.next_page_cursor = nil
    end

    private
    def fetch_next_page
      fetch_options = {limit: DEFAULT_PAGE_SIZE}.merge(serialized_options)
      fetch_options = fetch_options.merge({after: next_page_cursor}) if next_page_cursor

      node.get_edge(name, fetch_options) do |response|
        response["data"].each do |data|
          field_type = self.class.return_types[:get]

          obj = field_type.deserialize(data, node.session)
          collection << obj
        end

        self.next_page_cursor = response.dig('paging', 'cursors', 'after')
        self.has_next_page = !!response.dig('paging', 'next')
      end
    end

    def collection
      @collection ||= Array.new
    end

    def has_next_page?
      self.has_next_page.nil? ? (self.has_next_page = true) : self.has_next_page
    end

    def loaded?
      @loaded
    end
  end

  module EdgeHasPost
    def create(params)
      if self.class.param_set_for_post
        params = self.class.param_set_for_post.to_params(params)
      end

      node.post_edge(name, graph_params.merge(params)) do |response|
        # TODO params check
        # TODO Add new object to collection?

        field_type = self.class.return_types[:post]

        obj = field_type.deserialize(response, node.session)
        yield obj if block_given?
        obj
      end
    end
  end

  module EdgeHasDelete
    def destroy(params)
      params = @param_set_for_delete.to_params(params) if @param_set_for_delete

      node.delete_edge(name, params) do |response|
        yield response if block_given?
        response
      end
    end
  end

  class Edge
    attr_reader :name, :node, :options, :should_delegate

    def initialize(name, node, should_delegate, options)
      @name = name
      @node = node
      @options = options || {}
      @should_delegate = should_delegate
    end

    def serialized_options
      Hash[options.map { |k,v|
        v = (k == :fields && v.is_a?(Array)) ?
             v.join(',') : v
        [k,v]
      }]
    end

    # TODO refactor
    # sending this along with params to leverage read-after-write
    def graph_params
      {fields: options[:fields]}.compact
    end

    class << self
      attr_reader :param_set_for_get, :param_set_for_post, :param_set_for_delete

      def get(return_type = 'AdObject')
        include EdgeHasGet

        yield (@param_set_for_get = ParamSet.new) if block_given?

        return_types(:get, return_type)
      end

      def post(return_type = 'AdObject')
        include EdgeHasPost

        yield (@param_set_for_post = ParamSet.new) if block_given?

        return_types(:post, return_type)
      end

      def delete(return_type = 'AdObject')
        include EdgeHasDelete

        yield (@param_set_for_delete = ParamSet.new) if block_given?

        return_types(:delete, return_type)
      end

      # TODO refactor?
      def return_types(action = nil, return_type = nil)
        if action
          if return_type
            @return_types ||= {}
            @return_types[action] = FieldTypes.for(return_type)
          end
          @return_types[action]
        else
          @return_types
        end
      end
    end
  end
end
