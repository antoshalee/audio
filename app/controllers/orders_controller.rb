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

  def attach_record
    @order = Order.find params[:id]
    authorize! :attach_record_to, @order

    event_params = params.require(:event).permit([:records_attributes => [:file_cache]])

    @order.events.create!(event_params.merge(kind: 'record_attached', user: current_user))
    redirect_to :back
  end

end
