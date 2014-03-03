class OrdersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource except: %i(index speaker client modal)

  def index
  	@orders = Order.where.not(state: :created)
      where(speaker: current_user.try(:speaker)).decorate
  end

  def speaker
    @orders = Order.where.not(state: :created).
      where(speaker: current_user.try(:speaker)).
      page(params[:page]).per(5).decorate
    render :index
  end

  def client
    @orders = Order.where.not(state: :created).
      where(client: current_user).
      page(params[:page]).per(5).decorate
    render :index
  end

  def modal
  	raise "Not AJAX request" unless request.xhr?
  	@order = Order.find(params[:id]).decorate
  	render layout: false
  end

  def ask_clarification
    perform_action :ask_clarification, :clarification_asked, [:message]
  end

  def clarify
    perform_action :clarify, :clarified, [:message]
  end

  def start
    perform_action :start, :started
  end

  def deny_by_speaker
    perform_action :deny_by_speaker, :denied_by_speaker
  end

  def attach_record
    perform_action :attach_record, :record_attached,
      [:records_attributes => [:file_cache]]
  end

  def decline
    perform_action :decline, :declined, [:message]
  end

  def accept
    perform_action :accept, :accepted
  end

  private

  def perform_action action, event_kind, permitted=[]
    attrs = {kind: event_kind, user: current_user}
    attrs.merge!(params.require(:event).permit(permitted)) if permitted.present?
    ActiveRecord::Base.transaction do
      @order.send("#{action}!")
      @order.events.create!(attrs)
    end
    redirect_to :back
  end

end
