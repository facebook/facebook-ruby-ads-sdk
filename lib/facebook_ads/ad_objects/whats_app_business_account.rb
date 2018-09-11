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

# FB:AUTOGEN

module FacebookAds
  # This class is auto-generated.

  # For any issues or feature requests related to this class, please let us know
  # on github and we'll fix in our codegen framework. We'll not be able to accept
  # pull request for this class.

  class WhatsAppBusinessAccount < AdObject

    field :analytics, 'object'
    field :business_type, 'string'
    field :currency, 'string'
    field :friendly_name, 'string'
    field :hsm_namespace, 'string'
    field :id, 'string'
    field :on_behalf_of_business_computed_info, 'object'
    field :primary_funding_id, 'string'
    field :status, 'string'
    field :timezone_id, 'string'
    has_no_post
    has_no_delete

    has_edge :assigned_users do |edge|
      edge.get 'AssignedUser'
    end

    has_edge :hsms do |edge|
      edge.get do |api|
        api.has_param :name, 'string'
        api.has_param :tag, { list: { enum: %w{ACCOUNT_UPDATE PAYMENT_UPDATE PERSONAL_FINANCE_UPDATE SHIPPING_UPDATE RESERVATION_UPDATE ISSUE_RESOLUTION APPOINTMENT_UPDATE TRANSPORTATION_UPDATE TICKET_UPDATE ALERT_UPDATE }} }
        api.has_param :status, { list: { enum: %w{APPROVED PENDING REJECTED }} }
        api.has_param :element, 'string'
        api.has_param :language, { list: 'string' }
        api.has_param :name_or_element, 'string'
      end
    end

    has_edge :in_progress_onbehalf_request do |edge|
      edge.get 'BusinessOwnedObjectOnBehalfOfRequest'
    end

    has_edge :phone_number_statuses do |edge|
      edge.get
    end

  end
end
