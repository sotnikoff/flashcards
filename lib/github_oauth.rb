module GithubOauth
  extend self

  def perform_token_request(client_id, client_secret, code)
    form_params = { client_id: client_id, client_secret: client_secret, code: code }
    client = Faraday.new(url: 'https://github.com')
    response = client.post do |req|
      req.url 'login/oauth/access_token'
      req.headers['Accept'] = 'application/json'
      req.body = form_params
    end
    JSON.parse(response.body)['access_token'] if response.status == 200
  end
end