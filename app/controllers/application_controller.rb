class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    unless params[:user].nil?
      params[:user][:Birthday_year] = params[:user]['Birthday(1i)'].to_i
      params[:user][:Birthday_month] = params[:user]['Birthday(2i)'].to_i
      params[:user][:Birthday_day] = params[:user]['Birthday(3i)'].to_i
    end
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :Birthday_year, :Birthday_month, :Birthday_day, :first_name_kanji, :last_name_kanji, :first_name_katakana, :last_name_katakana])
  end
end
