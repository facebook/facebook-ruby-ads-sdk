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

require 'digest'

module FacebookAds
  module CustomAudienceHelpers
    SCHEMAS = %w{
      UID
      EMAIL_SHA256
      PHONE_SHA256
      MOBILE_ADVERTISER_ID
    }

    MULTIKEY_SCHEMAS = %w{
      EXTERN_ID
      EMAIL
      PHONE
      GEN
      DOBY
      DOBM
      DOBD
      LN
      FN
      FI
      CT
      ST
      ZIP
      MADID
      COUNTRY
    }

    SCHEMAS_WITHOUT_HASH = %w{
      EXTERN_ID
      MOBILE_ADVERTISER_ID
    }

    def add_user(data, schema)
      self.users.create(prepare_params(data: data, schema: schema))
    end

    def remove_user(data, schema)
      self.users.destroy(prepare_params(data: data, schema: schema))
    end

    def prepare_params(data:,
                       schema:,
                       app_ids:     nil,
                       page_ids:    nil,
                       pre_hashed:  false,
                       namespace:   nil,
                       session:     nil,
                       data_source: nil)

      unless schema.is_a?(Array) || schema.split(',').length > 1
        # single key
        schema = schema.upcase
        unless is_valid_single_key?(schema) || is_combinational_key?(schema)
          raise InvalidParameterError, "#{schema} is not a valid schema"
        end

        data = pre_hashed ? data : data.map { |entry| generate_hash(entry, schema)}
        is_raw = !is_combinational_key?(schema)
      else
        # multi key
        schema = schema.split(',') unless schema.is_a?(Array)

        data = data.map do |row|
          raise 'Schema size and data size mismatch' if row.length != schema.length

          row.each_with_index.map do |val, idx|
            pre_hashed ? val : generate_hash(val, schema[idx])
          end
        end

        is_raw = !(schema.map { |s| is_combinational_key?(s) }.any?)
      end

      {
        payload: {
          schema: schema,
          data: data,
          is_raw: is_raw,
          app_ids: app_ids,
          page_ids: page_ids,
          data_source: data_source,
        }.compact,
        namespace: namespace,
        session: session,
      }.compact
    end

    private
    def is_valid_single_key?(schema)
      SCHEMAS.include?(schema)
    end

    def is_raw_schema?(schemas)
      (schemas - MULTIKEY_SCHEMAS).empty?
    end

    def generate_hash(data, schema)
      SCHEMAS_WITHOUT_HASH.include?(schema) ? normalize(data, schema) : hash_sha256(normalize(data, schema))
    end

    def is_combinational_key?(schema)
      schema_parts = schema.split('_').map(&:upcase)
      return false if schema == 'EXTERN_ID' || schema_parts.count <= 1
      # EXTERN_ID will be safe here since it's can be used as combination key

      (schema_parts - MULTIKEY_SCHEMAS).empty?
    end

    def normalize(data, schema)
      schema = schema.gsub(/_SHA256$/,'') # remove hash suffix
      # Data normalization
      # Refer to https://developers.facebook.com/docs/marketing-api/audiences-api for rules

      case schema
        when 'EMAIL'
          data.to_s.strip.downcase
        when 'PHONE'
          data.to_s.gsub(/[^0-9]/,'')
        when 'GEN'
          # Match the first F or M character
          data.to_s[/[mfMF]/] || (raise InvalidParameterError, "Invalid value: #{data} for Gender")
        when 'DOBY'
          data.to_s.strip.gsub(/[^0-9]/,'')
        when 'DOBM','DOBD'
          data.to_s.strip.gsub(/[^0-9]/,'').rjust(2,'0')
        when 'LN', 'FN'
          data.to_s.strip.gsub(/[^[:alpha:]]/,'').downcase # using [:alpha] here to include also Unicode
        when 'FI'
          data.to_s.strip[0].downcase
        when 'ST', 'CT'
          data.to_s.strip.downcase.gsub(/[^a-z]+/,'')
        when 'ZIP'
          data.to_s.split('-').first.strip.gsub(/[:blank:]+/,'').downcase
        when 'MADID'
          data.to_s.downcase
        when 'COUNTRY'
          if data.strip.length != 2
            raise InvalidParameterError, "Only 2-letter country codes is accepted for COUNTRY"
          end
          data.strip.downcase
        else # UID, EXTERN_ID, MOBILE_ADVERTISER_ID
          data
      end
    end

    def hash_sha256(data)
      Digest::SHA256.hexdigest(data)
    end
  end
end
