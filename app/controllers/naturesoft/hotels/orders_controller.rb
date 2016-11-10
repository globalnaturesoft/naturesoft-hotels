module Naturesoft
  module Hotels
    class OrdersController < Naturesoft::FrontendController
      
      def invoice
				render :layout => false
			end
      
      # POST /reviews
      def create
        @order = Order.new(order_params)
        if @order.save
					
					# send @order email: admin + customer
					Naturesoft::Hotels::OrderMailer.sending_announce_email_order(@order).deliver_now
					Naturesoft::Hotels::OrderMailer.sending_customer_email_order(@order).deliver_now
					
					respond_to do |format|
						format.html {
							redirect_to naturesoft_hotels.hotel_detail_path(hotel_id: @order.hotel_id), notice: 'Order was successfully created.'
						}
						format.json {
							render json: {
								title: t(:success),
								message: t(:hotel_ordered_success)
							}
						}
					end
				else
          render :new
        end
      end
      
      private
        # Only allow a trusted parameter "white list" through.
        def order_params
					params.require(:order).permit(:first_name, :last_name, :email, :phone, :tel, :checkin, :checkout, :adult, :child, :note, :number, :room_id, :hotel_id, :user_id)
				end
    end
  end
end
