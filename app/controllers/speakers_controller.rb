class SpeakersController < ApplicationController

  def index
  	# @q = Speaker.search(params[:q])
   #  @speakers = @q.result.page(params[:page]).per(10)
    @speakers = Speaker.limit(10)
    render layout: false
  end
end
