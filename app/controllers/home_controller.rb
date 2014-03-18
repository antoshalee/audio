class HomeController < ApplicationController
  def index
    @speakers = Speaker.limit(10).decorate
    @force_groups_to_be_opened = true
  end
end
