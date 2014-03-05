class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :favorite_speaker_ids

  protected

  def check_xhr
    raise "Not AJAX request" unless request.xhr?
  end

  def configure_permitted_parameters
    params = [
      :login,
      :random_login,
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
          Hash[Speaker::ONLINE_SCHEDULE_KEYS.map { |d| [d, []] }]
      ]
    ]
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(params) }
  end

  def favorite_speaker_ids
    return [] unless user_signed_in?
    @favorite_speaker_ids ||= current_user.favorite_speakers.pluck(:id)
  end

end
