class OrderStepsController < ApplicationController
  include Wicked::Wizard

  steps :base, :emphasis, :confirmation

  def show
    @order = Order.find session[:order_id]
    render_wizard
  end

  def update
    @order = Order.find session[:order_id]
    @order.update_attributes(order_params)
    render_wizard @order
  end

  def create
    @order = Order.create!
    session[:order_id] = @order.id
    redirect_to wizard_path(steps.first)
  end

  private

  def order_params
    params.require(:order).permit(:text, :description, :name, :duration)
  end

end
