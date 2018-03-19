class GithubSessionsController < ApplicationController
  def new
    redirect_to root_path, notice: 'Already signed in' if session[:current_user_id]
    id = Rails.application.secrets.github_client_id
    redirect_to "https://github.com/login/oauth/authorize?client_id=#{id}&scope=user"
  end

  def callback
    return redirect_to root_path unless params[:code]
    auth
    redirect_to root_path
  end

  private

  def auth
    data = GithubOauth.perform_auth(
      Rails.application.secrets.github_client_id,
      Rails.application.secrets.github_client_secret,
      params[:code]
    )
    register_user(data[:email], data[:token])
  end

  def register_user(email, token)
    user = User.find_by(email: email)
    if user
      user.update(github_token: token)
      session[:current_user_id] = user.id
    else
      new_user = User.create(email: email, github_token: token)
      session[:current_user_id] = new_user.id
    end
  end
end
