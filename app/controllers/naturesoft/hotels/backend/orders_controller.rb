module Naturesoft
  module Hotels
    module Backend
      class OrdersController < Naturesoft::Backend::BackendController
        before_action :set_order, only: [:show, :edit, :update, :enable, :disable, :destroy]
        before_action :default_breadcrumb
            
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Hotel", naturesoft_hotels.backend_orders_path
          add_breadcrumb "Booking", naturesoft_hotels.backend_orders_path
        end
        
        # GET /orders
        def index
          @orders = Order.search(params).paginate(:page => params[:page], :per_page => 10)
        end
    
        # GET /orders/1
        def show
        end
        #
        ## GET /orders/new
        #def new
        #  @order = Order.new
        #end
        #
        # GET /orders/1/edit
        def edit
          add_breadcrumb "Edit Booking", nil,  class: "active"
        end
        #
        ## POST /orders
        #def create
        #  @order = Order.new(order_params)
        #
        #  if @order.save
        #    redirect_to @order, notice: 'Order was successfully created.'
        #  else
        #    render :new
        #  end
        #end
    
        # PATCH/PUT /orders/1
        #def update
        #  if @order.update(order_params)
        #    redirect_to naturesoft_hotels.edit_backend_order_path(@order.id), notice: 'Booking was successfully updated.'
        #  else
        #    render :edit
        #  end
        #end
    
        # DELETE /orders/1
        def destroy
          @order.destroy
          render text: 'Booking was successfully destroyed.'
        end
        
        def enable
          @order.enable
          render text: 'Booking was successfully active.'
        end
        
        def disable
          @order.disable
          render text: 'Booking was successfully inactive.'
        end
        
        # DELETE /rooms/delete?ids=1,2,3
        def delete
          @orders = Order.where(id: params[:ids].split(","))
          @orders.destroy_all
          render text: 'Booking(s) was successfully destroyed.'
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_order
            @order = Order.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def order_params
            params.require(:order).permit(:first_name, :last_name, :email, :phone, :tel, :checkin, :checkout, :adult, :child, :note, :room_id, :hotel_id, :user_id)
          end
      end
    end
  end
end
