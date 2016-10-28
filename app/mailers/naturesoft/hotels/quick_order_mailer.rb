module Naturesoft::Hotels
  class QuickOrderMailer < Naturesoft::ApplicationMailer
    def sending_email_quick_order(quick_order)
      @email_to = Naturesoft::Option.options("hotels")["hotels"]["quick_order_announce_email"]
      @quick_order = quick_order
      send_email(@email_to, "[Quick Booking] You have just received a new request from #{@quick_order.email}")
    end
  end
end
