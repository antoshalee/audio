class OrdersController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@orders = Order.where(speaker: current_user.try(:speaker))
  end

  def modal
  	raise "Not AJAX request" unless request.xhr?
  	@order = Order.find params[:id]
  	render layout: false
  end

  def accept
    @order = Order.find params[:id]
    authorize! :accept_by_speaker, @order
    ActiveRecord::Base.transaction do
      @order.accept!
      @order.events.create!(kind: 'accepted', user: current_user)
    end
    redirect_to :back
  end
end
