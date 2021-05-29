class ApplicationController < ActionController::Base

  private
  def basic_auth
    authenticate_orrequest_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"], && password == ENV[BASIC_AUTH_PASSWORD]
  end
end

