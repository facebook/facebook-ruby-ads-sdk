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

  class AudienceStudy < AdObject
    STUDY_STATUS = [
      "EXPIRED",
      "COMPLETED",
      "RUNNING",
      "SCHEDULED",
    ]


    field :audience_definition, 'object'
    field :category, 'string'
    field :created_by, 'User'
    field :creation_time, 'datetime'
    field :custom_audience, 'CustomAudience'
    field :description, 'string'
    field :end_date, 'datetime'
    field :id, 'string'
    field :name, 'string'
    field :purpose, 'string'
    field :start_date, 'datetime'
    field :status, 'string'
    has_no_post
    has_no_delete

    has_edge :rules do |edge|
      edge.get 'AudienceInsightsRule' do |api|
        api.has_param :partial_name, 'string'
      end
    end

    has_edge :sample_posts do |edge|
      edge.get do |api|
        api.has_param :filters, 'object'
        api.has_param :limit, 'int'
      end
    end

  end
end
