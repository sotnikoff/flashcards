require 'uri'
require 'net/http'

class GithubSessionsController < ApplicationController
  def new
    id = Rails.application.secrets.github_client_id
    redirect_to "https://github.com/login/oauth/authorize?client_id=#{id}&scope=user"
  end

  def callback
    redirect_to root_path unless params[:code]

    GithubOauth.perform_token_request(
      Rails.application.secrets.github_client_id,
      Rails.application.secrets.github_client_secret,
      params[:code]
    )
    redirect_to root_path
  end
end
