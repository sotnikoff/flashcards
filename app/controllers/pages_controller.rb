class PagesController < ApplicationController
  def index
    locale = if current_user&.locale
               current_user.locale
             elsif header_locale
               header_locale
             else
               I18n.default_locale
             end
    redirect_to root_path(locale: locale)
  end

  private

  def header_locale
    http_accept_language.compatible_language_from(I18n.available_locales)
  end
end
