module Naturesoft::Hotels
  class QuickOrderMailer < Naturesoft::ApplicationMailer
    def sending_announce_email_quick_order(quick_order)
      @email_to = Naturesoft::Option.options("hotels")["hotels"]["quick_order_announce_email"]
      @quick_order = quick_order
      send_email(@email_to, "#{t(:announce_new_quick_booking)} #{@quick_order.email}")
    end
    def sending_customer_email_quick_order(quick_order)
      @quick_order = quick_order
      send_email(@quick_order.email, "#{t(:booking_hotel_successfully)}")
    end
  end
end
