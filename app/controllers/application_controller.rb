class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end

  def after_sign_in_path_for(_resource_or_scope)
    current_user.role == "refugee" ? bookings_path : rooms_path
  end 

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  add_flash_types :info, :error, :success
end
