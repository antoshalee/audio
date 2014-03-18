class HomeController < ApplicationController
  def index
    @speakers = Speaker.limit(10).decorate
    @force_groups_to_be_open = true
  end
end
