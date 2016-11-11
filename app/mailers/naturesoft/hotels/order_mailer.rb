module Naturesoft::Hotels
  class OrderMailer < Naturesoft::ApplicationMailer
    def sending_announce_email_order(order)
      @email_to = Naturesoft::Option.options("hotels")["hotels"]["order_announce_email"]
      @order = order
      send_email(@email_to, "#{t(:announce_new_order_booking)} #{@order.email}")
    end
    def sending_customer_email_order(order)
      @order = order
      send_email(@order.email, "#{t(:order_booking_hotel_successfully)}")
    end
  end
end
