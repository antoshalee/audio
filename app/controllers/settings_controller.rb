class SettingsController < ApplicationController
  before_filter :authenticate_user!

  def account
    @user = current_user
  end

  def update
    @user = current_user

    if update_current_user
      redirect_to action: :account
    else
      render action: :account
     end
  end

  private

  def permitted_user_params
    params.require(:user).permit(:phone, :email, :avatar, :password, :password_confirmation, :current_password)
  end

  def update_current_user


    if permitted_user_params[:current_password].present?
      @user.update_with_password(permitted_user_params)
    else
      @user.update_attributes(permitted_user_params.delete_if { |k,v| v.blank? })
    end
  end

end
