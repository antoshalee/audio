class SpeakersController < ApplicationController
  has_scope :with_timbre_level
  has_scope :by_order_category
  has_scope :with_sex
  has_scope :with_voice_types, type: :array
  has_scope :with_age_types, type: :array

  def index
    @speakers = apply_scopes(Speaker.scoped).decorate
  end

  def show
    @user = User.find_by_login(params[:id])
    raise ActiveRecord::RecordNotFound unless (@user && @user.speaker?)
    @speaker = @user.speaker.decorate
  end

  def count
    raise "Not AJAX request" unless request.xhr?
    count = apply_scopes(Speaker.scoped).count
    render json: { count: count }
  end

end
