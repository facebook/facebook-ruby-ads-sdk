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

require 'facebook_ads/version'
require 'facebook_ads/helpers/shortcuts'
require 'facebook_ads/crash_logger'

module FacebookAds
  DEFAULT_API_VERSION = 'v' + API_VERSION
  DEFAULT_HOST = 'graph.facebook.com'

  extend self
  extend Shortcuts

  def with_session(access_token, secret = nil, api_version = DEFAULT_API_VERSION)
    original_session = Session.current_session
    Session.current_session = Session.new(access_token, secret, api_version)
    yield
    Session.current_session = original_session
  end

  def configure
    @config ||= Config.new
    yield @config if block_given?
    CrashLogger.enable if @config.crash_logging_enabled
    @config
  end

  alias_method :config, :configure

  require 'facebook_ads/ruby2patch'

  require 'facebook_ads/session'
  require 'facebook_ads/config'
  require 'facebook_ads/errors'
  require 'facebook_ads/fields'
  require 'facebook_ads/edge'
  require 'facebook_ads/param_set'
  require 'facebook_ads/ad_object'
  require 'facebook_ads/field_types'

  require 'facebook_ads/utils/utils'
  require 'facebook_ads/videos/video_io'

  require 'facebook_ads/batch_api/batch'
  require 'facebook_ads/batch_api/batch_proxy'

  # Autoload Ad Objects Helpers
  Dir.glob(File.expand_path(File.join(__FILE__, '..', 'facebook_ads', 'ad_objects', 'helpers', '*.rb'))).each do |file|
    class_name = File.basename(file, '.rb').split('_').map(&:capitalize).join.to_sym
    autoload class_name, file
  end

  # Autoload AdObjects
  Dir.glob(File.expand_path(File.join(__FILE__, '..', 'facebook_ads', 'ad_objects', '*.rb'))).each do |file|
    class_name = File.basename(file, '.rb').split('_').map(&:capitalize).join.to_sym
    autoload class_name, file
  end

  module ServerSide
    # Autoload Server-Side API
    Dir.glob(File.expand_path(File.join(__FILE__, '..', 'facebook_ads', 'ad_objects', 'server_side', '*.rb'))).each do |file|
      class_name = File.basename(file, '.rb').split('_').map(&:capitalize).join.to_sym
      autoload class_name, file
    end
  end
end
