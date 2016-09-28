require_dependency "naturesoft/application_controller"

module Naturesoft
  module Hotels
    module Admin
      class ServicesController < Naturesoft::Admin::AdminController
        before_action :set_service, only: [:show, :edit, :update, :destroy, :enable, :disable]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Hotel", naturesoft_hotels.admin_services_path
          add_breadcrumb "Service", naturesoft_hotels.admin_services_path
        end
    
        # GET /services
        def index
          @services = Service.search(params).paginate(:page => params[:page], :per_page => Naturesoft::Option.get("hotels", "services_items_per_page"))
        end
    
        # GET /services/1
        def show
        end
    
        # GET /services/new
        def new
          @service = Service.new
          add_breadcrumb "New Service", nil,  class: "active"
        end
    
        # GET /services/1/edit
        def edit
          add_breadcrumb "New Service", nil,  class: "active"
        end
    
        # POST /services
        def create
          @service = Service.new(service_params)
          @service.user = current_user
    
          if @service.save
            redirect_to naturesoft_hotels.edit_admin_service_path(@service.id), notice: 'Service was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /services/1
        def update
          if @service.update(service_params)
            redirect_to naturesoft_hotels.edit_admin_service_path(@service.id), notice: 'Service was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /services/1
        def destroy
          @service.destroy
          render text: 'Service was successfully destroyed.'
        end
        
        #CHANGE STATUS /services
        def enable
          @service.enable
          render text: 'Service was successfully active.'
        end
        
        def disable
          @service.disable
          render text: 'Service was successfully inactive.'
        end
        
        # DELETE /services/delete?ids=1,2,3
        def delete
          @services = Service.where(id: params[:ids].split(","))
          @services.destroy_all
          render text: 'Service(s) was successfully destroyed.'
        end
        
        # GET /services/select2
        def select2
          render json: Service.select2(params)
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_service
            @service = Service.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def service_params
            params.fetch(:service, {}).permit(:name)
          end
      end
    end
  end
end
