class PagesController < ApplicationController
  def show
    @page = Page.find_by_slug params[:url]
    raise ActionController::RoutingError.new('Not Found') unless @page
  end
end
