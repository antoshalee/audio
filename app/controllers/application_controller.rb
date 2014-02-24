class ApplicationController < ActionController::Base

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
      :speaker_attributes => [
        :sex,
        :rate,
        :timbre_level,
        :records_attributes => [:file, :file_cache],
        :voice_type_ids     => [],
        :age_type_ids       => [],
        :category_ids       => [],
        :online_schedule    =>
          Hash[Date::DAYNAMES.map { |d| [d.downcase, []] }]
      ]
    ]
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(params) }
  end

end
