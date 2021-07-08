require 'spec_helper'

RSpec.describe FacebookAds::Batch do
  describe "#execute" do
    let(:expected_api_response) do
      status = 200
      headers = { content_type: "application/json" }
      body = [
        {
          "code" => status,
          "headers": headers.map { |k, v| { name: k, value: v } },
          "body" => { "id" => "act_123456", "name" => "test account name" }
        }
      ].to_json
      FacebookAds::APIResponse.new(status, headers, body)
    end
    before do
      expect_any_instance_of(FacebookAds::APIRequest).to receive(:execute_now).and_return(expected_api_response)
    end

    it do
      batch = FacebookAds::Batch.with_batch do
        FacebookAds::AdAccount.get("act_123456").name
      end
      batch_api_responses = batch.execute
      api_responses = batch_api_responses.first
      api_response = api_responses.first

      expect(api_response).to be_a FacebookAds::AdAccount
      expect(api_response).to match have_attributes(id: "act_123456", name: "test account name")
    end
  end
end
