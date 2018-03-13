module GithubOauth
  extend self

  def perform_auth(client_id, client_secret, code)
    token = perform_token_request(client_id, client_secret, code)
    if token
      get_user_emails(token)
    end
  end

  private

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

  def get_user_emails(token)
    client = Faraday.new(url: 'https://api.github.com')
    response = client.get do |req|
      req.url 'user/emails'
      req.headers['Authorization'] = "token #{token}"
    end
    result = JSON.parse(response.body).select do |hash|
      hash['primary']
    end
    result[0]['email']
  end
end
