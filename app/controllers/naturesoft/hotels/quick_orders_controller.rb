module Naturesoft
  module Hotels
    class QuickOrdersController < Naturesoft::FrontendController
      # POST /quick_orders
      def quick_booking
        @quick_order = QuickOrder.new(quick_order_params)
  
        if @quick_order.save
          render text: 'Sent successfully.'
        else
          render text: 'Send failed.'
        end
      end
  
      private
        # Only allow a trusted parameter "white list" through.
        def quick_order_params
          params.fetch(:quick_order, {}).permit(:first_name, :last_name, :email, :phone, :message)
        end
    end
  end
end
