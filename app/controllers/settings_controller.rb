class SettingsController < ApplicationController
  before_filter :authenticate_user!

  def account
  end

  def update
    current_user.update_attributes(permitted_user_params)
    redirect_to action: :account
  end

  private

  def permitted_user_params
    params.require(:user).permit(:phone, :email, :avatar)
  end

end
