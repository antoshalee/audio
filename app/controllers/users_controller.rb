class UsersController < ApplicationController
  def show
    @user = User.find_by_login(params[:id])
    raise ActiveRecord::RecordNotFound unless (@user && @user.speaker?)
    @speaker = @user.speaker.decorate
  end
end
