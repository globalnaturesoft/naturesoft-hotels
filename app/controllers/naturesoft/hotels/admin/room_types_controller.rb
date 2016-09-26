module Naturesoft
  module Hotels
    module Admin
      class RoomTypesController < Naturesoft::Admin::AdminController
        before_action :set_room_type, only: [:show, :edit, :update, :enable, :disable, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Hotel", naturesoft_hotels.admin_room_types_path
          add_breadcrumb "Room Types", naturesoft_hotels.admin_room_types_path
        end
        
        # GET /room_types
        def index
          @room_types = RoomType.search(params).paginate(:page => params[:page], :per_page => 10)
        end
    
        # GET /room_types/1
        def show
        end
    
        # GET /room_types/new
        def new
          @room_type = RoomType.new
        end
    
        # GET /room_types/1/edit
        def edit
        end
    
        # POST /room_types
        def create
          @room_type = RoomType.new(room_type_params)
          @room_type.user = current_user
    
          if @room_type.save
            redirect_to naturesoft_hotels.edit_admin_room_type_path(@room_type.id), notice: 'Room type was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /room_types/1
        def update
          if @room_type.update(room_type_params)
            redirect_to naturesoft_hotels.edit_admin_room_type_path(@room_type.id), notice: 'Room type was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /room_types/1
        def destroy
          @room_type.destroy
          render text: 'Room type was successfully destroyed.'
        end
        
        def enable
          @room_type.enable
          render text: 'Room type was successfully active.'
        end
        
        def disable
          @room_type.disable
          render text: 'Room type was successfully inactive.'
        end
        
        # DELETE /room_types/delete?ids=1,2,3
        def delete
          @room_types = RoomType.where(id: params[:ids].split(","))
          @room_types.destroy_all
          render text: 'Room types(s) was successfully destroyed.'
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_room_type
            @room_type = RoomType.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def room_type_params
            params.fetch(:room_type, {}).permit(:name, :status)
          end
      end
    end
  end
end
