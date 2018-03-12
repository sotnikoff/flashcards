class RegistrationsController < ApplicationController
  def new; end

  def create
    user = User.new(email: params[:email], password_hash: Auth.generate(params[:password]))
    notice = t('.registration_failed')
    if compare_passwords && user.save
      session[:current_user_id] = user.id
      notice = t('.registration_done')
    end
    redirect_to root_path, notice: notice
  end

  private

  def compare_passwords
    params[:password] == params[:password_confirmation]
  end
end
