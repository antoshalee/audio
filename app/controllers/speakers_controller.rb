class SpeakersController < ApplicationController
  has_scope :with_timbre_level
  has_scope :by_order_category
  has_scope :with_sex
  has_scope :with_voice_types, type: :array
  has_scope :with_age_types, type: :array
  has_scope :online, type: :boolean
  helper_method :similar_speakers
  before_filter :check_xhr, only: [:count, :add_to_favorites]

  def index
    @speakers = apply_scopes(Speaker.scoped).decorate
  end

  def show
    @user = User.find_by_login(params[:id])
    raise ActiveRecord::RecordNotFound unless (@user && @user.speaker?)
    @speaker = @user.speaker.decorate
  end

  def count
    count = apply_scopes(Speaker.scoped).count
    render json: { count: count }
  end

  def toggle_favorite
    render json: {status: try_toggle_favorite}
  end

  private

  def similar_speakers
    Speaker.order("RANDOM()").where.not(id: @speaker.id).decorate.first(2)
  end

  def try_toggle_favorite
    speaker = Speaker.find params[:id]
    favorite = Favorite.where(user_id: current_user).where(speaker_id: speaker).first
    if favorite.present?
      favorite.destroy!
      :destroy
    else
      Favorite.create!(user: current_user, speaker: speaker)
      :create
    end
  end

end
