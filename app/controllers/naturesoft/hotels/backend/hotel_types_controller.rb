require_dependency "naturesoft/application_controller"

module Naturesoft
  module Hotels
    module Backend
      class HotelTypesController < Naturesoft::Backend::BackendController
        before_action :set_hotel_type, only: [:show, :edit, :update, :destroy, :enable, :disable]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Hotel", naturesoft_hotels.backend_hotel_types_path
          add_breadcrumb "Hotel Types", naturesoft_hotels.backend_hotel_types_path
        end
    
        # GET /hotel_types
        def index
          @hotel_types = HotelType.search(params).paginate(:page => params[:page], :per_page => 10)
        end
    
        # GET /hotel_types/1
        def show
        end
    
        # GET /hotel_types/new
        def new
          @hotel_type = HotelType.new
          add_breadcrumb "New Hotel Type", nil,  class: "active"
        end
    
        # GET /hotel_types/1/edit
        def edit
          add_breadcrumb "New Hotel Type", nil,  class: "active"
        end
    
        # POST /hotel_types
        def create
          @hotel_type = HotelType.new(hotel_type_params)
          @hotel_type.user = current_user
    
          if @hotel_type.save
            redirect_to naturesoft_hotels.edit_backend_hotel_type_path(@hotel_type.id), notice: 'Hotel type was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /hotel_types/1
        def update
          if @hotel_type.update(hotel_type_params)
            redirect_to naturesoft_hotels.edit_backend_hotel_type_path(@hotel_type.id), notice: 'Hotel type was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /hotel_types/1
        def destroy
          @hotel_type.destroy
          render text: 'Hotel type was successfully destroyed.'
        end
        
        def enable
          @hotel_type.enable
          render text: 'Hotel type was successfully active.'
        end
        
        def disable
          @hotel_type.disable
          render text: 'Hotel type was successfully inactive.'
        end
        
        # DELETE /room_types/delete?ids=1,2,3
        def delete
          @hotel_types = HotelType.where(id: params[:ids].split(","))
          @hotel_types.destroy_all
          render text: 'Hotel type(s) was successfully destroyed.'
        end
        
        # GET /room_types/select2
        def select2
          render json: HotelType.select2(params)
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_hotel_type
            @hotel_type = HotelType.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def hotel_type_params
            params.fetch(:hotel_type, {}).permit(:name)
          end
      end
    end
  end
end
