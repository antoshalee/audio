class SpeakersController < ApplicationController

  def index
  	@q = Speaker.search(params[:q])
    @speakers = @q.result.page(params[:page]).per(10)
  end
end
