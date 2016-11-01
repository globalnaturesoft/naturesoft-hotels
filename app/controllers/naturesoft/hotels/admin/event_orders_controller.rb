require_dependency "naturesoft/application_controller"

module Naturesoft::Hotels
  class EventOrdersController < ApplicationController
    before_action :set_event_order, only: [:show, :edit, :update, :destroy]

    # GET /event_orders
    def index
      @event_orders = EventOrder.all
    end

    # GET /event_orders/1
    def show
    end

    # GET /event_orders/new
    def new
      @event_order = EventOrder.new
    end

    # GET /event_orders/1/edit
    def edit
    end

    # POST /event_orders
    def create
      @event_order = EventOrder.new(event_order_params)

      if @event_order.save
        redirect_to @event_order, notice: 'Event order was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /event_orders/1
    def update
      if @event_order.update(event_order_params)
        redirect_to @event_order, notice: 'Event order was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /event_orders/1
    def destroy
      @event_order.destroy
      redirect_to event_orders_url, notice: 'Event order was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_event_order
        @event_order = EventOrder.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def event_order_params
        params.require(:event_order).permit(:first_name, :last_name, :email, :phone, :checkin, :checkout, :event_name, :event_price, :hotel_id, :event_id, :user_id)
      end
  end
end
