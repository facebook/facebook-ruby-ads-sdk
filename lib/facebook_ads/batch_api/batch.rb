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
  class Batch
    attr_accessor :operations, :session, :last_api_response

    def initialize
      @operations = []
    end

    def <<(api_req)
      @operations << api_req
      @session ||= api_req.session
      api_req
    end

    def execute
      return [] if operations.empty?
      operations.each_slice(50).map do |slice|
        api_response = APIRequest.new(:post, '', session: session, params: batch_args(slice)).execute_now
        self.last_api_response = api_response
        slice.zip(api_response.result).map do |req, res|
          next unless res

          begin
            req.create_response(
                res['code'],
                convert_headers_to_hash(res['headers']),
                res['body'])
          rescue APIError => e
            e
          end
        end
      end
    end

    def batch_args(slice = operations)
      {batch: JSON.dump(operations_args(slice))}.merge(files_args)
    end

    def operations_args(slice)
      slice.map do |api_req|
        api_req.to_batch_params
      end
    end

    def files_args
      operations.map do |api_req|
        api_req.files
      end.reduce(&:merge)
    end

    class << self
      attr_accessor :current_batch

      def with_batch
        new.tap do |current_batch|
          self.current_batch = current_batch
          yield if block_given?
          self.current_batch = nil
        end
      end
    end

    private
    def convert_headers_to_hash(headers)
      Faraday::Utils::Headers.new(
          Hash[headers.map {|h| [h['name'], h['value']]}]
      )
    end
  end
end
