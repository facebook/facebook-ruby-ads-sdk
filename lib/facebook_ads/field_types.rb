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

require 'facebook_ads/field_types/base'

module FacebookAds
  module FieldTypes
    def register(*type_names)
      type_names.each do |type_name|
        registry[type_name] = self
      end
    end

    def lookup(type_name)
      if registry.has_key?(type_name)
        registry[type_name]
      elsif type_name.respond_to?(:include?) && type_name.include?('map<')
        registry['map']
      end
    end

    def registry
      @@registry ||= {}
    end

    def for(type_spec)
      if type_spec.is_a?(Hash)
        type_key = type_spec.keys[0]

        if field_type = lookup(type_key)
          field_type.new(type_spec[type_key])
        else
          raise "Invalid type: #{type_key}"
        end
      else
        if (field_type = lookup(type_spec))
          field_type.new
        else
          begin
            ad_object_class = FacebookAds.const_get(type_spec)
            field_type = lookup('ad_object')
            field_type.new(ad_object_class)
          rescue NameError
            # fallback to string class if nothing matches
            lookup('string').new
          end
        end
      end
    end

    extend self
  end
end

Dir.glob(File.expand_path(File.join(__FILE__, '..', 'field_types', '*.rb'))).each do |file|
  require file
end
