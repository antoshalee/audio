class SettingsController < ApplicationController
  def account
  end

  def update
    current_user.update_attributes(permitted_user_params)
    redirect_to action: :account
  end

  private

  def permitted_user_params
    params.require(:user).permit(:phone, :email)
  end

end
