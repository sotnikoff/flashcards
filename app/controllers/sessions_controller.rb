class SessionsController < ApplicationController
  def new; end

  def create
    user = User.where(email: params[:email]).first
    notice = t('.authorization_failed')
    if user && Auth.authenticate(user.password_hash, params[:password])
      session[:current_user_id] = user.id
      notice = t('.authorization_done')
    end
    redirect_to root_path, notice: notice
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path, notice: t('.log_out_done')
  end
end
