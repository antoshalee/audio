class HomeController < ApplicationController
  def index
    @speakers = Speaker.limit(10).decorate
  end
end
