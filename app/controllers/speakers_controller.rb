class SpeakersController < ApplicationController

  def index
    @speakers = Speaker.page(params[:page]).per(10)
  end
end
