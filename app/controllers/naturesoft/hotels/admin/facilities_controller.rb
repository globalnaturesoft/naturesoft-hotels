module Naturesoft
  module Hotels
    module Admin
      class FacilitiesController < Naturesoft::Admin::AdminController
        before_action :set_facility, only: [:show, :edit, :update, :enable, :disable, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Hotel", naturesoft_hotels.admin_facilities_path
          add_breadcrumb "Facilities", naturesoft_hotels.admin_facilities_path
        end
        
        # GET /facilities
        def index
          @facilities = Facility.search(params).paginate(:page => params[:page], :per_page => 10)
        end
    
        # GET /facilities/1
        def show
        end
    
        # GET /facilities/new
        def new
          @facility = Facility.new
          add_breadcrumb "New Facility", nil,  class: "active"
        end
    
        # GET /facilities/1/edit
        def edit
          add_breadcrumb "Edit Facility", nil,  class: "active"
        end
    
        # POST /facilities
        def create
          @facility = Facility.new(facility_params)
          @facility.user = current_user
    
          if @facility.save
            redirect_to naturesoft_hotels.edit_admin_facility_path(@facility.id), notice: 'Facility was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /facilities/1
        def update
          if @facility.update(facility_params)
            redirect_to naturesoft_hotels.edit_admin_facility_path(@facility.id), notice: 'Facility was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /facilities/1
        def destroy
          @facility.destroy
          render text: 'Facility was successfully destroyed.'
        end
        
        def enable
          @facility.enable
          render text: 'Facility was successfully active.'
        end
        
        def disable
          @facility.disable
          render text: 'Facility was successfully inactive.'
        end
        
        # DELETE /facilities/delete?ids=1,2,3
        def delete
          @facilities = BedType.where(id: params[:ids].split(","))
          @facilities.destroy_all
          render text: 'Facility(s) was successfully destroyed.'
        end
        
        # GET /facilities/select2
        def select2
          render json: Facility.select2(params)
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_facility
            @facility = Facility.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def facility_params
            params.fetch(:facility, {}).permit(:name, :status)
          end
      end
    end
  end
end
