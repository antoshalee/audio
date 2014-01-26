class SpeakersController < ApplicationController

  has_scope :by_timbre_level
  has_scope :by_order_category
  has_scope :with_sex
  has_scope :with_voice_types, type: :array

  def index
    @speakers = Speaker.limit(10)
    render layout: false
  end

  def count
    raise "Not AJAX request" unless request.xhr?
    count = apply_scopes(Speaker.scoped).count
    render json: { count: count }
  end

end
