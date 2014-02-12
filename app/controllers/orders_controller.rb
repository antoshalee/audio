class OrdersController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@orders = Order.where(speaker: current_user.try(:speaker)).decorate
  end

  def speaker
    @orders = Order.where(speaker: current_user.try(:speaker)).decorate
    render :index
  end

  def client
    @orders = Order.where(client: current_user).decorate
    render :index
  end

  def modal
  	raise "Not AJAX request" unless request.xhr?
  	@order = Order.find(params[:id]).decorate
  	render layout: false
  end

  def start
    @order = Order.find params[:id]
    authorize! :start, @order
    ActiveRecord::Base.transaction do
      @order.start!
      @order.events.create!(kind: 'started', user: current_user)
    end
    redirect_to :back
  end

  def attach_record
    @order = Order.find params[:id]
    authorize! :attach_record_to, @order
    event_params = params.require(:event).permit([:records_attributes => [:file_cache]])
    ActiveRecord::Base.transaction do
      @order.attach_record!
      @order.events.create!(event_params.merge(kind: 'record_attached', user: current_user))
    end
    redirect_to :back
  end

  def decline
    @order = Order.find params[:id]
    authorize! :decline, @order
    event_params = params.require(:event).permit([:message])
    ActiveRecord::Base.transaction do
      @order.decline!
      @order.events.create!(event_params.merge(kind: 'declined', user: current_user))
    end
    redirect_to :back
  end

  def accept
    @order = Order.find params[:id]
    authorize! :accept, @order
    ActiveRecord::Base.transaction do
      @order.accept!
      @order.events.create!(kind: 'accepted', user: current_user)
    end
    redirect_to :back
  end
end
