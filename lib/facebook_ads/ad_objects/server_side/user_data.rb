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
  module ServerSide

    # UserData is a set of identifiers Facebook can use for targeted attribution
    class UserData

      # A list of email addresses, in lowercase.
      # Example: ['joe@eg.com']
      attr_accessor :emails

      # An email address, in lowercase.
      # Example: joe@eg.com
      def email
        @emails ? @emails[0] : nil
      end
      def email=(email)
        @emails = [email]
      end

      # A list of phone numbers. Include only digits with country code, area code, and number.
      # Example: ['16505551212']
      attr_accessor :phones

      # A phone number. Include only digits with country code, area code, and number.
      # Example: 16505551212
      def phone
        @phones ? @phones[0] : nil
      end
      def phone=(phone)
        @phones = [phone]
      end

      # A list of genders, in lowercase.
      # Example: ['f']
      attr_accessor :genders

      # Gender, in lowercase. Either f or m.
      def gender
        @genders ? @genders[0] : nil
      end
      def gender=(gender)
        @genders = [gender]
      end

      # A list of dates of birth given as year, month, and day.
      # Format should be 'YYYYMMDD'
      # Example: ['19971226'] for December 26, 1997.
      attr_accessor :dates_of_birth

      # A date of birth given as year, month, and day.
      # Format should be 'YYYYMMDD'
      # Example: 19971226 for December 26, 1997.
      def date_of_birth
        @dates_of_birth ? @dates_of_birth[0] : nil
      end
      def date_of_birth=(date_of_birth)
        @dates_of_birth = [date_of_birth]
      end

      # A list of last names in lowercase.
      # Example: ['smith']
      attr_accessor :last_names

      # A last name in lowercase.
      # Example: smith
      def last_name
        @last_names ? @last_names[0] : nil
      end
      def last_name=(last_name)
        @last_names = [last_name]
      end

      # A list of first names in lowercase.
      # Example: ['joe']
      attr_accessor :first_names

      # A first name in lowercase.
      # Example: joe
      def first_name
        @first_names ? @first_names[0] : nil
      end
      def first_name=(first_name)
        @first_names = [first_name]
      end

      # A list of cities in lower-case without spaces or punctuation.
      # Example: ['menlopark']
      attr_accessor :cities

      # A city in lower-case without spaces or punctuation.
      # Example: menlopark
      def city
        @cities ? @cities[0] : nil
      end
      def city=(city)
        @cities = [city]
      end

      # A list of two-letter country codes in lowercase.
      # Example: ['us']
      attr_accessor :country_codes

      # A two-letter country code in lowercase.
      # Example: us
      def country_code
        @country_codes ? @country_codes[0] : nil
      end
      def country_code=(country_code)
        @country_codes = [country_code]
      end

      # A list of two-letter state codes in lowercase.
      # Example: ['ca']
      attr_accessor :states

      # A two-letter state code in lowercase.
      # Example: ca
      def state
        @states ? @states[0] : nil
      end
      def state=(state)
        @states = [state]
      end

      # A list of five-digit zip codes for United States.
      # For other locations, follow each country's standards.
      # Example: ['94035'] (for United States)
      attr_accessor :zip_codes

      # A five-digit zip code for United States.
      # For other locations, follow each country's standards.
      # Example: 94035 (for United States)
      def zip_code
        @zip_codes ? @zip_codes[0] : nil
      end
      def zip_code=(zip_code)
        @zip_codes = [zip_code]
      end

      # A list of unique IDs from the advertiser, such as loyalty membership IDs, user IDs, and external cookie IDs.
      # In the Offline Conversions API (https://www.facebook.com/business/help/104039186799009),
      # this is known as extern_id. For more information, see Offline Conversions, Providing External IDs.
      # If External ID is being sent via other channels, then it should be sent in the same format
      # via the Conversions API.
      attr_accessor :external_ids

      # Any unique ID from the advertiser, such as loyalty membership IDs, user IDs, and external cookie IDs.
      # In the Offline Conversions API (https://www.facebook.com/business/help/104039186799009),
      # this is known as extern_id. For more information, see Offline Conversions, Providing External IDs.
      # If External ID is being sent via other channels, then it should be sent in the same format
      # via the Conversions API.
      def external_id
        @external_ids ? @external_ids[0] : nil
      end
      def external_id=(external_id)
        @external_ids = [external_id]
      end

      # The IP address of the browser corresponding to the event.
      attr_accessor :client_ip_address

      # The user agent for the browser corresponding to the event.
      attr_accessor :client_user_agent

      # The Facebook click ID value stored in the _fbc browser cookie under your domain.
      # See Managing fbc and fbp Parameters for how to get this value
      # (https://developers.facebook.com/docs/marketing-api/facebook-pixel/conversions-api/parameters#fbc),
      # or generate this value from a fbclid query parameter.
      attr_accessor :fbc

      # The Facebook browser ID value stored in the _fbp browser cookie under your domain.
      # See Managing fbc and fbp Parameters for how to get this value
      # (https://developers.facebook.com/docs/marketing-api/facebook-pixel/conversions-api/parameters#fbc),
      # or generate this value from a fbclid query parameter.
      attr_accessor :fbp

      # The subscription ID for the user in this transaction. This is similar to the order ID for an individual product.
      attr_accessor :subscription_id

      # ID issued by Facebook when a person first logs into an instance of an app. This is also known as App-Scoped ID.
      attr_accessor :fb_login_id

      # The lead ID for the user in this transaction. This ID is associated with a lead generated by Facebook's Lead Ads.
      attr_accessor :lead_id

      # The first 5 letters of the first name.
      attr_accessor :f5first

      # The first 5 letters of the last name.
      attr_accessor :f5last

      # The first initial.
      attr_accessor :fi

      # The date of birth day.
      attr_accessor :dobd

      # The date of birth month.
      attr_accessor :dobm

      # The date of birth year.
      attr_accessor :doby

      #UserData is a set of identifiers Facebook can use for targeted attribution
      # @param [String] email
      # @param [Array<String>] emails
      # @param [String] phone
      # @param [Array<String>] phones
      # @param [String] gender
      # @param [Array<String>] genders
      # @param [String] date_of_birth
      # @param [Array<String>] dates_of_births
      # @param [String] last_name
      # @param [Array<String>] last_names
      # @param [String] first_name
      # @param [Array<String>] first_names
      # @param [String] city
      # @param [Array<String>] cities
      # @param [String] state
      # @param [Array<String>] states
      # @param [String] country_code
      # @param [Array<String>] country_codes
      # @param [String] zip_code
      # @param [Array<String>] zip_codes
      # @param [String] external_id
      # @param [Array<String>] external_ids
      # @param [String] client_ip_address
      # @param [String] client_user_agent
      # @param [String] fbc
      # @param [String] fbp
      # @param [String] subscription_id
      # @param [String] fb_login_id
      # @param [String] lead_id
      # @param [String] f5first
      # @param [String] f5last
      # @param [String] fi
      # @param [String] dobd
      # @param [String] dobm
      # @param [String] doby
      def initialize(email: nil, emails: nil, phone: nil, phones: nil, gender: nil, genders: nil,
                     date_of_birth: nil, dates_of_birth: nil, last_name: nil, last_names: nil,
                     first_name: nil, first_names: nil, city: nil, cities: nil, state: nil, states: nil,
                     country_code: nil, country_codes: nil, zip_code: nil, zip_codes: nil,
                     external_id: nil, external_ids: nil, client_ip_address: nil,
                     client_user_agent: nil, fbc: nil, fbp: nil, subscription_id: nil, fb_login_id: nil, lead_id: nil,
                     f5first: nil, f5last: nil, fi: nil, dobd: nil, dobm: nil, doby: nil)
        validate_constructor_values(emails, email, 'emails', 'email')
        validate_constructor_values(phones, phone, 'phones', 'phone')
        validate_constructor_values(genders, gender, 'genders', 'gender')
        validate_constructor_values(dates_of_birth, date_of_birth, 'dates_of_birth', 'date_of_birth')
        validate_constructor_values(first_names, first_name, 'first_names', 'first_name')
        validate_constructor_values(last_names, last_name, 'last_names', 'last_name')
        validate_constructor_values(cities, city, 'cities', 'city')
        validate_constructor_values(country_codes, country_code, 'country_codes', 'country_code')
        validate_constructor_values(states, state, 'states', 'state')
        validate_constructor_values(zip_codes, zip_code, 'zip_codes', 'zip_code')
        validate_constructor_values(external_ids, external_id, 'external_ids', 'external_id')

        unless email.nil?
          self.email = email
        end
        unless emails.nil?
          self.emails = emails
        end
        unless phone.nil?
          self.phone = phone
        end
        unless phones.nil?
          self.phones = phones
        end
        unless gender.nil?
          self.gender = gender
        end
        unless genders.nil?
          self.genders = genders
        end
        unless date_of_birth.nil?
          self.date_of_birth = date_of_birth
        end
        unless dates_of_birth.nil?
          self.dates_of_birth = dates_of_birth
        end
        unless last_name.nil?
          self.last_name = last_name
        end
        unless last_names.nil?
          self.last_names = last_names
        end
        unless first_name.nil?
          self.first_name = first_name
        end
        unless first_names.nil?
          self.first_names = first_names
        end
        unless city.nil?
          self.city = city
        end
        unless cities.nil?
          self.cities = cities
        end
        unless state.nil?
          self.state = state
        end
        unless states.nil?
          self.states = states
        end
        unless country_code.nil?
          self.country_code = country_code
        end
        unless country_codes.nil?
          self.country_codes = country_codes
        end
        unless zip_code.nil?
          self.zip_code = zip_code
        end
        unless zip_codes.nil?
          self.zip_codes = zip_codes
        end
        unless external_id.nil?
          self.external_id = external_id
        end
        unless external_ids.nil?
          self.external_ids = external_ids
        end
        unless client_ip_address.nil?
          self.client_ip_address = client_ip_address
        end
        unless client_user_agent.nil?
          self.client_user_agent = client_user_agent
        end
        unless fbc.nil?
          self.fbc = fbc
        end
        unless fbp.nil?
          self.fbp = fbp
        end
        unless subscription_id.nil?
          self.subscription_id = subscription_id
        end
        unless fb_login_id.nil?
          self.fb_login_id = fb_login_id
        end
        unless lead_id.nil?
          self.lead_id = lead_id
        end
        unless f5first.nil?
          self.f5first = f5first
        end
        unless f5last.nil?
          self.f5last = f5last
        end
        unless fi.nil?
          self.fi = fi
        end
        unless dobd.nil?
          self.dobd = dobd
        end
        unless dobm.nil?
          self.dobm = dobm
        end
        unless doby.nil?
          self.doby = doby
        end
      end

      # build the object using the input hash
      # @param [Hash] attributes  attributes in the form of hash
      def build(attributes = {})
        return unless attributes.is_a?(Hash)

        # convert string to symbol for hash key
        attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

        if attributes.has_key?(:'emails')
          self.emails = attributes[:'emails']
        elsif attributes.has_key?(:'email')
          self.emails = [attributes[:'email']]
        end

        if attributes.has_key?(:'phones')
          self.phones = attributes[:'phones']
        elsif attributes.has_key?(:'phone')
          self.phones = [attributes[:'phone']]
        end

        if attributes.has_key?(:'genders')
          self.genders = attributes[:'genders']
        elsif attributes.has_key?(:'gender')
          self.genders = [attributes[:'gender']]
        end

        if attributes.has_key?(:'dates_of_birth')
          self.dates_of_birth = attributes[:'dates_of_birth']
        elsif attributes.has_key?(:'date_of_birth')
          self.dates_of_birth = [attributes[:'date_of_birth']]
        end

        if attributes.has_key?(:'last_names')
          self.last_names = attributes[:'last_names']
        elsif attributes.has_key?(:'last_name')
          self.last_names = [attributes[:'last_name']]
        end

        if attributes.has_key?(:'first_names')
          self.first_names = attributes[:'first_names']
        elsif attributes.has_key?(:'first_name')
          self.first_names = [attributes[:'first_name']]
        end

        if attributes.has_key?(:'cities')
          self.cities = attributes[:'cities']
        elsif attributes.has_key?(:'city')
          self.cities = [attributes[:'city']]
        end

        if attributes.has_key?(:'country_codes')
          self.country_codes = attributes[:'country_codes']
        elsif attributes.has_key?(:'country_code')
          self.country_codes = [attributes[:'country_code']]
        end

        if attributes.has_key?(:'states')
          self.states = attributes[:'states']
        elsif attributes.has_key?(:'state')
          self.states = [attributes[:'state']]
        end

        if attributes.has_key?(:'zip_codes')
          self.zip_codes = attributes[:'zip_codes']
        elsif attributes.has_key?(:'zip_code')
          self.zip_codes = [attributes[:'zip_code']]
        end

        if attributes.has_key?(:'external_ids')
          self.external_ids = attributes[:'external_ids']
        elsif attributes.has_key?(:'external_id')
          self.external_ids = [attributes[:'external_id']]
        end

        if attributes.has_key?(:'client_ip_address')
          self.client_ip_address = attributes[:'client_ip_address']
        end

        if attributes.has_key?(:'client_user_agent')
          self.client_user_agent = attributes[:'client_user_agent']
        end

        if attributes.has_key?(:'fbc')
          self.fbc = attributes[:'fbc']
        end

        if attributes.has_key?(:'fbp')
          self.fbp = attributes[:'fbp']
        end

        if attributes.has_key?(:'fb_login_id')
          self.fb_login_id = attributes[:'fb_login_id']
        end

        if attributes.has_key?(:'lead_id')
          self.lead_id = attributes[:'lead_id']
        end

        if attributes.has_key?(:'f5first')
          self.f5first = attributes[:'f5first']
        end

        if attributes.has_key?(:'f5last')
          self.f5last = attributes[:'f5last']
        end

        if attributes.has_key?(:'fi')
          self.fi = attributes[:'fi']
        end

        if attributes.has_key?(:'dobd')
          self.dobd = attributes[:'dobd']
        end

        if attributes.has_key?(:'dobm')
          self.dobm = attributes[:'dobm']
        end

        if attributes.has_key?(:'doby')
          self.doby = attributes[:'doby']
        end
      end

      # Checks equality by comparing each attribute.
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            emails == o.emails &&
            phones == o.phones &&
            genders == o.genders &&
            dates_of_birth == o.dates_of_birth &&
            last_names == o.last_names &&
            first_names == o.first_names &&
            cities == o.cities &&
            country_codes == o.country_codes &&
            states == o.states &&
            zip_codes == o.zip_codes &&
            external_ids == o.external_ids &&
            client_ip_address == o.client_ip_address &&
            client_user_agent == o.client_user_agent &&
            fbc == o.fbc &&
            fbp == o.fbp &&
            subscription_id == o.subscription_id &&
            fb_login_id == o.fb_login_id &&
            lead_id == o.lead_id &&
            f5first == o.f5first &&
            f5last == o.f5last &&
            fi == o.fi &&
            dobd == o.dobd &&
            dobm == o.dobm &&
            doby == o.doby
      end

      # @see the `==` method
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Fixnum] Hash code
      def hash
        [
            emails,
            phones,
            genders,
            dates_of_birth,
            last_names,
            first_names,
            cities,
            country_codes,
            states,
            zip_codes,
            external_ids,
            client_ip_address,
            client_user_agent,
            fbc,
            fbp,
            subscription_id,
            fb_login_id,
            lead_id,
            f5first,
            f5last,
            fi,
            dobd,
            dobm,
            doby,
        ].hash

      end

      # Returns the string representation of the object
      # @return [String] String presentation of the object
      def to_s
        hash = {}
        unless emails.nil?
          hash['emails'] = emails
        end
        unless phones.nil?
          hash['phones'] = phones
        end
        unless genders.nil?
          hash['genders'] = genders
        end
        unless dates_of_birth.nil?
          hash['dates_of_birth'] = dates_of_birth
        end
        unless last_names.nil?
          hash['last_names'] = last_names
        end
        unless first_names.nil?
          hash['first_names'] = first_names
        end
        unless cities.nil?
          hash['cities'] = cities
        end
        unless country_codes.nil?
          hash['country_codes'] = country_codes
        end
        unless states.nil?
          hash['states'] = states
        end
        unless zip_codes.nil?
          hash['zip_codes'] = zip_codes
        end
        unless external_ids.nil?
          hash['external_ids'] = external_ids
        end
        unless client_ip_address.nil?
          hash['client_ip_address'] = client_ip_address
        end
        unless client_user_agent.nil?
          hash['client_user_agent'] = client_user_agent
        end
        unless fbc.nil?
          hash['fbc'] = fbc
        end
        unless fbp.nil?
          hash['fbp'] = fbp
        end
        unless subscription_id.nil?
          hash['subscription_id'] = subscription_id
        end
        unless fb_login_id.nil?
          hash['fb_login_id'] = fb_login_id
        end
        unless lead_id.nil?
          hash['lead_id'] = lead_id
        end
        unless f5first.nil?
          hash['f5first'] = f5first
        end
        unless f5last.nil?
          hash['f5last'] = f5last
        end
        unless fi.nil?
          hash['fi'] = fi
        end
        unless dobd.nil?
          hash['dobd'] = dobd
        end
        unless dobm.nil?
          hash['dobm'] = dobm
        end
        unless doby.nil?
          hash['doby'] = doby
        end
        hash.to_s
      end


      # Normalize input fields to server request format.
      def normalize
        hash = {}
        unless email.nil?
          hash['em'] = FacebookAds::ServerSide::Util.normalize_array(emails, 'em')
        end
        unless phone.nil?
          hash['ph'] = FacebookAds::ServerSide::Util.normalize_array(phones, 'ph')
        end
        unless gender.nil?
          hash['ge'] = FacebookAds::ServerSide::Util.normalize_array(genders, 'ge')
        end
        unless date_of_birth.nil?
          hash['db'] = FacebookAds::ServerSide::Util.normalize_array(dates_of_birth, 'db')
        end
        unless last_name.nil?
          hash['ln'] = FacebookAds::ServerSide::Util.normalize_array(last_names, 'ln')
        end
        unless first_name.nil?
          hash['fn'] = FacebookAds::ServerSide::Util.normalize_array(first_names, 'fn')
        end
        unless city.nil?
          hash['ct'] = FacebookAds::ServerSide::Util.normalize_array(cities, 'ct')
        end
        unless country_code.nil?
          hash['country'] = FacebookAds::ServerSide::Util.normalize_array(country_codes, 'country')
        end
        unless state.nil?
          hash['st'] = FacebookAds::ServerSide::Util.normalize_array(states, 'st')
        end
        unless zip_code.nil?
          hash['zp'] = FacebookAds::ServerSide::Util.normalize_array(zip_codes, 'zp')
        end
        unless external_id.nil?
          hash['external_id'] = external_ids
        end
        unless client_ip_address.nil?
          hash['client_ip_address'] = client_ip_address
        end
        unless client_user_agent.nil?
          hash['client_user_agent'] = client_user_agent
        end
        unless fbc.nil?
          hash['fbc'] = fbc
        end
        unless fbp.nil?
          hash['fbp'] = fbp
        end
        unless subscription_id.nil?
          hash['subscription_id'] = subscription_id
        end
        unless fb_login_id.nil?
          hash['fb_login_id'] = fb_login_id
        end
        unless lead_id.nil?
          hash['lead_id'] = lead_id
        end
        unless f5first.nil?
          hash['f5first'] = FacebookAds::ServerSide::Util.normalize(f5first, 'f5first')
        end
        unless f5last.nil?
          hash['f5last'] = FacebookAds::ServerSide::Util.normalize(f5last, 'f5last')
        end
        unless fi.nil?
          hash['fi'] = FacebookAds::ServerSide::Util.normalize(fi, 'fi')
        end
        unless dobd.nil?
          hash['dobd'] = FacebookAds::ServerSide::Util.normalize(dobd, 'dobd')
        end
        unless dobm.nil?
          hash['dobm'] = FacebookAds::ServerSide::Util.normalize(dobm, 'dobm')
        end
        unless doby.nil?
          hash['doby'] = FacebookAds::ServerSide::Util.normalize(doby, 'doby')
        end
        hash.select{|k, v| !v.nil?}
      end

      def validate_constructor_values(multi_value, single_value, multi_string, single_string)
        if !multi_value.nil? && !single_value.nil?
          raise ArgumentError.new(
            'Cannot set both %s and %s parameters via constructor. ' % [
              multi_string, single_string
            ] + 'Please set either the multi or single parameter, not both.'
          )
        end
      end
    end
  end
end
