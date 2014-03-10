class SettingsController < ApplicationController
  before_filter :authenticate_user!

  def account
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_with_password(permitted_user_params)
      redirect_to action: :account
    else
      render action: :account
     end
  end

  private

  def permitted_user_params
    params.require(:user).permit(:phone, :email, :avatar, :password, :password_confirmation, :current_password)
  end

end
