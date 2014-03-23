class SettingsController < ApplicationController
  before_filter :authenticate_user!

  def account
    @user = current_user
    if request.patch?
      if update_current_user
        redirect_to :back
      else
        render :account
      end
    end
  end

  def speaker
    @user = current_user
    @speaker = current_user.speaker
    return redirect_to settings_account_path unless @speaker

    if request.patch?
      if @speaker.update_attributes(permitted_speaker_params)
        redirect_to :back
      else
        render :speaker
      end
    end
  end

  def update
    @user = current_user

    if update_current_user
      redirect_to :back
    else
      render :account
    end
  end

  private

  def permitted_user_params
    params.require(:user).permit(:phone, :email, :avatar, :password, :password_confirmation, :current_password)
  end

  def permitted_speaker_params
    params.require(:speaker).permit(
      :sex,
      :rate,
      :timbre_level,
      :voice_type_ids     => [],
      :age_type_ids       => [],
      :category_ids       => []
    )
  end

  def update_current_user
    if permitted_user_params[:current_password].present?
      @user.update_with_password(permitted_user_params)
    else
      @user.update_attributes(permitted_user_params.delete_if { |k,v| v.blank? })
    end
  end

end
