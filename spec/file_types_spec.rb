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

require 'spec_helper'

RSpec.describe FacebookAds::FieldTypes do
  subject(:this) { FacebookAds::FieldTypes }

  describe '.lookup' do
    subject(:lookup) { this.lookup(type) }

    context 'when map<string, int> field type is given' do
      let(:type) { 'map<string, int>' }
      it { expect(lookup).to eq(FacebookAds::FieldTypes::Object) }
    end

    context 'when map<string, string> field type is given' do
      let(:type) { 'map<string, string>' }
      it { expect(lookup).to eq(FacebookAds::FieldTypes::Object) }
    end

    context 'when map field type is given' do
      let(:type) { 'map' }
      it { expect(lookup).to eq(FacebookAds::FieldTypes::Object) }
    end

    context 'when object field type is given' do
      let(:type) { 'object' }
      it { expect(lookup).to eq(FacebookAds::FieldTypes::Object) }
    end

    context 'when hash field type is given' do
      let(:type) { 'hash' }
      it { expect(lookup).to eq(FacebookAds::FieldTypes::Object) }
    end
  end
end
