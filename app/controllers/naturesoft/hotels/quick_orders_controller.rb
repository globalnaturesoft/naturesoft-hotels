module Naturesoft
  module Hotels
    class QuickOrdersController < Naturesoft::FrontendController
      before_action :set_quick_order
      
      # POST /quick_orders
      def quick_booking
        @quick_order = QuickOrder.new(quick_order_params)
  
        if @quick_order.save
          render text: 'Quick order was successfully created.'
        else
          render text: 'Sorry!.'
        end
      end
  
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_quick_order
          @quick_order = QuickOrder.find(params[:id])
        end
  
        # Only allow a trusted parameter "white list" through.
        def quick_order_params
          params.fetch(:quick_order, {}).permit(:first_name, :last_name, :email, :phone, :message)
        end
    end
  end
end
