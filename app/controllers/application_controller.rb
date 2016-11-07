class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  before_filter :configure_permitted_parameters, if: :devise_controller?
    def basic
      authenticate_or_request_with_http_basic do |user, pass|
        user == APP_CONFIG["auth_user"] && pass == APP_CONFIG["auth_pass"]
      end
    end

rescue_from ActiveRecord::RecordNotFound, with: :render_404
rescue_from ActionController::RoutingError, with: :render_404
rescue_from Exception, with: :render_500

def render_404
  render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
end

#def render_500
#  render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
#end

  protected
    def configure_permitted_parameters
 #     devise_parameter_sanitizer.for(:sign_up) << :name
 #     devise_parameter_sanitizer.for(:sign_up) << :account_id
    end
end
