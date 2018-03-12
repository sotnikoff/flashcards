class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  NotAuthorized = Class.new(StandardError)

  def authorize!
    unless current_user
      raise NotAuthorized
    end
  end

  def current_user
    @current_user ||= User.where(id: session[:current_user_id]).first
  end
end
