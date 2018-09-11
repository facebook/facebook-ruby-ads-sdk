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

  class AdKpiShift < AdObject
    EVENT_SOURCE = [
      "ADS_DELIVERY_DASHBOARD_BUNNYLOL",
      "ADS_DELIVERY_DEBUGGER",
      "ADS_DELIVERY_INSIGHTS_AVAILABILITY_TOOL",
      "ADS_MANAGER_DELIVERY_COLUMN",
      "CHECKOUT_GRADUATION_FLOW",
      "NOTIFICATIONS",
      "POWER_EDITOR_DELIVERY_COLUMN",
      "BEST_PRACTICES_REPORT",
      "UNKNOWN",
    ]


    field :ad_set, 'AdSet'
    field :cost_per_result_shift, 'double'
    field :enough_effective_days, 'bool'
    field :result_indicator, 'string'
    field :result_shift, 'double'
    field :spend_shift, 'double'
    field :id, 'string'
    has_no_post
    has_no_delete

  end
end
