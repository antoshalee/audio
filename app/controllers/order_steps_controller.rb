class OrderStepsController < ApplicationController
  include Wicked::Wizard

  steps :base, :emphasis, :confirmation

  def show
    @order = Order.find session[:order_id]
    @speaker = @order.speaker
    render_wizard
  end

  def update
    @order = Order.find session[:order_id]
    @order.update_attributes(order_params)
    @order.activate! if step == steps.last
    render_wizard @order
  end

  def create
    speaker = Speaker.find(params[:speaker])
    @order = Order.create!(speaker: speaker)

    session[:order_id] = @order.id
    redirect_to wizard_path(steps.first)
  end

  private

  def order_params
    params.require(:order).permit(:text, :description, :name, :duration)
  end

end
