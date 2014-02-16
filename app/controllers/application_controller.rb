class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    params = [
      :login,
      :email,
      :phone,
      :password,
      :password_confirmation,
      :avatar,
      speaker_attributes: [
        :sex,
        :timbre_level,
        :records_attributes => [:file, :file_cache],
        :voice_type_ids => [],
        :age_type_ids => [],
        :category_ids => []
      ]
    ]
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(params) }
  end

end
