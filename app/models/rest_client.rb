class RestClient

  cattr_accessor :create_tunnel_api_url, :illegal_token_response_status, :illegal_token_message, :uri_host, :uri_port

  RestClient.create_tunnel_api_url = 'http://54.157.15.140/tunnelCreate'
  RestClient.illegal_token_response_status = "illegal_param"
  RestClient.illegal_token_message = "Token can't be empty"
  RestClient.uri_host = "54.157.15.140"
  RestClient.uri_port = "80"

  def self.set_params
    invalid_token_id = "asjwuaasu89322sddsdINVALID"
    invalid_signature = "dsdsjsjsINVALID"
    timestamp = Time.now
    domain = "default"

    data = Hash.new
    data["tunnelCreate"] = Hash.new
    data["tunnelCreate"]["device_id"] = "fxvd8ebd2858"
    data["tunnelCreate"]["device_ports"] = ["80"]

    request_params = Hash.new
    request_params["token_id"] = invalid_token_id
    request_params["signature"] = invalid_signature
    request_params["timestamp"] = timestamp
    request_params["domain"] = domain
    request_params["data"] = data
    request_params
  end

  def self.post(illegal_token_response_status, create_tunnel_api_url, request_params = self.set_params)
    http = Net::HTTP.new(uri_host, uri_port)
    request = Net::HTTP::Post.new('http://54.157.15.140/tunnelCreate', {'Content-Type' =>'application/json'})
    request.body = request.to_json
    response = http.request(request)
    response
  end

end
