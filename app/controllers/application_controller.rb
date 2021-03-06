class ApplicationController < ActionController::Base
  before_action :basic_auth
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :firstname_kanji, :lastname_kanji, :firstname_katakana, :lastname_katakana, :birth_day])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end
end
