class SessionsController < ApplicationController
  def new; end

  def create
    user = User.where(email: params[:email]).first
    if user && Auth.authenticate(user.password_hash, params[:password])
      session[:current_user] = user.id
      redirect_to root_path, notice: 'Successfully logged in'
    else
      redirect_to root_path, notice: 'Bad login'
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to root_path, notice: 'Successfully logged out'
  end
end
