module Naturesoft
  module Hotels
    class EventOrdersController < Naturesoft::FrontendController
      # POST /event_orders
      def create
        @event_order = EventOrder.new(event_order_params)
  
        if @event_order.save
          redirect_to naturesoft_hotels.hotel_detail_path(hotel_id: @event_order.hotel_id), notice: 'Event order was successfully created.'
        else
          render :new
        end
      end
  
      private
        # Only allow a trusted parameter "white list" through.
        def event_order_params
          params.require(:event_order).permit(:first_name, :last_name, :email, :phone, :number, :checkin, :checkout, :event_name, :event_price, :hotel_id, :event_id, :user_id)
        end
    end
  end
end