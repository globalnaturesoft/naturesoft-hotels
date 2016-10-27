module Naturesoft::Hotels
  class QuickOrderMailer < Naturesoft::ApplicationMailer
    def sending_email_quick_order(quick_order)
      @quick_order = quick_order
      send_email("tonhungstar@gmail.com", "[Quick Booking] You have received a new request")
    end
  end
end
