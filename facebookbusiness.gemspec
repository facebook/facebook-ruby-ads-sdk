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

require './lib/facebook_ads/version'

Gem::Specification.new do |s|
  s.name        = 'facebookbusiness'
  s.version     = FacebookAds::VERSION
  s.summary     = 'Facebook Business API SDK for Ruby (Official)'
  s.description = <<-DESC
  The official Facebook Business API SDK for Ruby.
  https://developers.facebook.com/docs/marketing-api/sdks'
  DESC
  s.authors     = ['Facebook']
  s.email       = ''
  s.homepage    =
    'https://github.com/facebook/facebook-ruby-business-sdk'
  s.license = 'Nonstandard'

  s.required_ruby_version = '~> 2.0'

  s.add_dependency 'faraday', '~> 1.0'
  s.add_dependency 'json', '~> 2.3'
  s.add_dependency 'countries', '~>3.0'
  s.add_dependency 'money', '~> 6.13'

  s.add_development_dependency 'awesome_print', '~> 1.8'
  s.add_development_dependency 'bundler', '~> 1.17'
  s.add_development_dependency 'byebug', '~> 11.1'
  s.add_development_dependency 'dotenv', '~> 2.7'
  s.add_development_dependency 'minitest', '~> 5.0'
  s.add_development_dependency 'pry', '~> 0.12'
  s.add_development_dependency 'pry-coolline', '~> 0.2'
  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rspec', '~> 3.9'
  s.add_development_dependency 'rubocop', '~> 0.89'
  s.add_development_dependency 'countries', '~>3.0'
  s.add_development_dependency 'money', '~> 6.13'

  s.files = Dir['LICENSE.txt', 'README.md', 'lib/**/*', 'bin/*']
  s.executables = s.files.grep(%r{^bin/}).map { |f| File.basename(f) }
end
