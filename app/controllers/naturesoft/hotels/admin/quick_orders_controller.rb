module Naturesoft
  module Hotels
    module Admin
      class QuickOrdersController < Naturesoft::Admin::AdminController
        before_action :set_quick_order, only: [:show, :edit, :update, :destroy, :enable, :disable]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Hotel", naturesoft_hotels.admin_quick_orders_path
          add_breadcrumb "Quick booking orders", naturesoft_hotels.admin_quick_orders_path
        end
    
        # GET /quick_orders
        def index
          @quick_orders = QuickOrder.search(params).paginate(:page => params[:page], :per_page => 10)
        end
    
        # GET /quick_orders/1
        def show
        end
    
        # GET /quick_orders/new
        def new
          @quick_order = QuickOrder.new
          add_breadcrumb "New Quick Order", nil,  class: "active"
        end
    
        # GET /quick_orders/1/edit
        def edit
          add_breadcrumb "Edit Quick Order", nil,  class: "active"
        end
    
        # POST /quick_orders
        def create
          @quick_order = QuickOrder.new(quick_order_params)
    
          if @quick_order.save
            redirect_to naturesoft_hotels.edit_admin_quick_order_path(@quick_order.id), notice: 'Quick order was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /quick_orders/1
        def update
          if @quick_order.update(quick_order_params)
            redirect_to naturesoft_hotels.edit_admin_quick_order_path(@quick_order.id), notice: 'Quick order was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /quick_orders/1
        def destroy
          @quick_order.destroy
          render text: 'Quick order was successfully destroyed.'
        end
        
        #CHANGE STATUS /quick_orders
        def enable
          @quick_order.enable
          render text: 'Quick order was successfully active.'
        end
        
        def disable
          @quick_order.disable
          render text: 'Quick order was successfully inactive.'
        end
        
        # DELETE /quick_orders/delete?ids=1,2,3
        def delete
          @quick_orders = QuickOrder.where(id: params[:ids].split(","))
          @quick_orders.destroy_all
          render text: 'Quick order(s) was successfully destroyed.'
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
end
