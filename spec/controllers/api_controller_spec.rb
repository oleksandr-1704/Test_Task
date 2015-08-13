require 'rails_helper'

RSpec.describe ApiController, type: :controller do
  let(:create_tunnel_api_url) { "http://54.157.15.140/tunnelCreate"}
  let(:invalid_token_id) { "asjwuaasu89322sddsdINVALID" }
  let(:invalid_signature) { "dsdsjsjsINVALID"}
  let(:timestamp) { Time.now }
  let(:domain) { "default" }
  let(:data) {
    data = Hash.new
    data["tunnelCreate"] = Hash.new
    data["tunnelCreate"]["device_id"] = "fxvd8ebd2858"
    data["tunnelCreate"]["device_ports"] = ["554"]
    data
  }
  let(:illegal_token_response_status) { "illegal_param" }
  let(:illegal_token_message) { "Token can't be empty" }
  let(:request_params) {
    request_params = Hash.new
    request_params["token_id"] = invalid_token_id
    request_params["signature"] = invalid_signature
    request_params["timestamp"] = timestamp
    request_params["domain"] = domain
    request_params["data"] = data
    request_params
  }

  describe "Create tunnel API" do
    it "should not pass with illegal token" do
      response = RestClient.post create_tunnel_api_url, request_params.to_json, :content_type => :json, :accept => :json

      header = JSON.parse(response.body)["header"]

      expect(response.code.to_i).to eq 200
      expect(header).to have_key("response_status")
      expect(header).to have_key("message")
      expect(header["response_status"]).to eq illegal_token_response_status
      expect(header["message"]).to eq illegal_token_message
    end
  end
end
