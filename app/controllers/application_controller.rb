class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_filter :basic, only: [:edit, :update, :destroy]
    def basic
      authenticate_or_request_with_http_basic do |user, pass|
        user == APP_CONFIG["auth_user"] && pass == APP_CONFIG["auth_pass"]
      end
    end

end
