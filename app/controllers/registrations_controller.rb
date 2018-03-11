class RegistrationsController < ApplicationController
  def new; end

  def create
    user = User.new(email: params[:email], password_hash: Auth.generate(params[:password]))
    if user.save
      redirect_to root_path, notice: 'Registration done!'
      session[:current_user_id] = user.id
    else
      redirect_to root_path, notice: 'Registration failed!'
    end
  end
end
