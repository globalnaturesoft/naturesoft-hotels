module Naturesoft::Hotels
  class EventOrderMailer < Naturesoft::ApplicationMailer
    def sending_announce_email_event_order(event_order)
      @email_to = Naturesoft::Option.options("hotels")["hotels"]["event_order_announce_email"]
      @event_order = event_order
      send_email(@email_to, "#{t(:announce_new_event_order_booking)} #{@event_order.email}")
    end
    def sending_customer_email_event_order(event_order)
      @event_order = event_order
      send_email(@event_order.email, "#{t(:event_order_booking_hotel_successfully)}")
    end
  end
end
