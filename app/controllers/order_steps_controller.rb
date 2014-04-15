class OrderStepsController < ApplicationController
  include Wicked::Wizard

  before_filter only: :update do
    authenticate_user! if params[:id] == 'confirmation'
  end

  steps :base, :emphasis, :confirmation

  def show
    @order = Order.find session[:order_id]
    @speaker = @order.speaker
    render_wizard
  end

  def update
    @order = Order.find session[:order_id]
    try_update_attributes
    @order.activate! if step == steps.last
    render_wizard @order
  end

  def create
    speaker = Speaker.find(params[:speaker])
    @order = Order.create!(speaker: speaker, client: current_user)

    session[:order_id] = @order.id
    redirect_to wizard_path(steps.first)
  end

  def finish_wizard_path
    flash[:notice] = "Заказ успешно создан"
    profile_path
  end

  private

  def try_update_attributes
    attrs = {}
    attrs.merge!(order_params) if params[:order].present?
    attrs.merge!(client: current_user) if should_assign_missing_client?
    @order.update_attributes(attrs) if attrs.present?
  end

  def order_params
    params.require(:order).permit(:text, :marked_text, :description,
      :name, :duration, :records_attributes => [:file_cache])
  end

  def should_assign_missing_client?
    @order.client.blank? && user_signed_in?
  end

end
