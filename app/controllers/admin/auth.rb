class Admin::Auth  <  ApplicationController #ActionController::Base # < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  #http_basic_authenticate_with name: "timmy", password: "home" #, except: :index


  #before_filter :set_locale, :check_user_data
  layout 'admin/auth'

  def set_locale
      I18n.locale = 'en' # params[:locale] || I18n.default_locale  #:fr
  end

end
