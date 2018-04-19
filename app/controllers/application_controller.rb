class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :set_locale

  NotAuthorized = Class.new(StandardError)

  def authorize!
    unless current_user
      raise NotAuthorized
    end
  end

  def current_user
    @current_user ||= User.where(id: session[:current_user_id]).first
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = params[:locale]
  end
end
