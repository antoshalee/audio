class SpeakersController < ApplicationController

  has_scope :by_timbre_level

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
