module Naturesoft
  module Hotels
    module Backend
      class EventOrdersController < Naturesoft::Backend::BackendController
        before_action :set_event_order, only: [:show, :edit, :update, :enable, :disable, :destroy]
        before_action :default_breadcrumb
            
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Booking Hotel", naturesoft_hotels.backend_event_orders_path
          add_breadcrumb "Event Booking", naturesoft_hotels.backend_event_orders_path
        end
        
        # GET /event_orders
        def index
          @event_orders = EventOrder.search(params).paginate(:page => params[:page], :per_page => 10)
        end
    
        # GET /event_orders/1
        def show
        end
    
        ## GET /event_orders/new
        #def new
        #  @event_order = EventOrder.new
        #end
        #
        ## GET /event_orders/1/edit
        #def edit
        #end
        #
        ## POST /event_orders
        #def create
        #  @event_order = EventOrder.new(event_order_params)
        #
        #  if @event_order.save
        #    redirect_to @event_order, notice: 'Event order was successfully created.'
        #  else
        #    render :new
        #  end
        #end
        #
        ## PATCH/PUT /event_orders/1
        #def update
        #  if @event_order.update(event_order_params)
        #    redirect_to @event_order, notice: 'Event order was successfully updated.'
        #  else
        #    render :edit
        #  end
        #end
    
        # DELETE /event_orders/1
        def destroy
          @event_order.destroy
          render text: 'Event Booking was successfully destroyed.'
        end
        
        def enable
          @event_order.enable
          render text: 'Event Booking was successfully active.'
        end
        
        def disable
          @event_order.disable
          render text: 'Event Booking was successfully inactive.'
        end
        
        # DELETE /event_orders/delete?ids=1,2,3
        def delete
          @event_orders = EventOrder.where(id: params[:ids].split(","))
          @event_orders.destroy_all
          render text: 'Event Bookings(s) was successfully destroyed.'
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_event_order
            @event_order = EventOrder.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def event_order_params
            params.require(:event_order).permit(:first_name, :last_name, :email, :phone, :number, :checkin, :checkout, :event_name, :event_price, :hotel_id, :event_id, :user_id)
          end
      end
    end
  end
end
