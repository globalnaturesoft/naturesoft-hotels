module Naturesoft
  module Hotels
    class EventOrdersController < Naturesoft::FrontendController
      # POST /event_orders
      def create
        @event_order = EventOrder.new(event_order_params)
        
        if @event_order.save
          
          # send @order email: admin + customer
          Naturesoft::Hotels::EventOrderMailer.sending_announce_email_event_order(@event_order).deliver_now
					Naturesoft::Hotels::EventOrderMailer.sending_customer_email_event_order(@event_order).deliver_now
          
          respond_to do |format|
            format.html {
              redirect_to naturesoft_hotels.hotel_detail_path(hotel_id: @event_order.hotel_id), notice: 'Event order was successfully created.'
            }
            format.json {
              render json: {
                title: t(:success),
                message: t(:event_ordered_success)
              }
            }
          end
        else
          puts @event_order.errors.full_messages
          # render :new
        end
        
        #if @event_order.save
        #  redirect_to naturesoft_hotels.hotel_detail_path(hotel_id: @event_order.hotel_id), notice: 'Event order was successfully created.'
        #else
        #  render :new
        #end
      end
  
      private
        # Only allow a trusted parameter "white list" through.
        def event_order_params
          params.require(:event_order).permit(:note, :first_name, :last_name, :email, :phone, :number, :checkin, :checkout, :event_name, :event_price, :hotel_id, :event_id, :user_id)
        end
    end
  end
end