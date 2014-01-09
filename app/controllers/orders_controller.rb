class OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def modal
  	raise "Not AJAX request" unless request.xhr?
  	@order = Order.find params[:id]
  	render layout: false
  end
end
