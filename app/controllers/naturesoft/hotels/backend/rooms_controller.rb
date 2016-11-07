module Naturesoft
  module Hotels
    module Backend
      class RoomsController < Naturesoft::Backend::BackendController
        before_action :set_room, only: [:show, :edit, :update, :enable, :disable, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Hotel", naturesoft_hotels.backend_hotels_path
          add_breadcrumb "Rooms", naturesoft_hotels.backend_hotels_path
        end
        
        # GET /rooms
        def index
          @rooms = Room.search(params).paginate(:page => params[:page], :per_page => Naturesoft::Option.get("hotels", "rooms_items_per_page"))
        end
    
        # GET /rooms/1
        def show
        end
    
        # GET /rooms/new
        def new
          @room = Room.new
          add_breadcrumb "New Room", nil,  class: "active"
        end
    
        # GET /rooms/1/edit
        def edit
          add_breadcrumb "Edit Room", nil,  class: "active"
        end
    
        # POST /rooms
        def create
          @room = Room.new(room_params)
          @room.user = current_user
          
          if @room.save
            redirect_to naturesoft_hotels.edit_backend_room_path(@room.id), notice: 'Room was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /rooms/1
        def update
          @room.services.clear
          
          if @room.update(room_params)
            redirect_to naturesoft_hotels.edit_backend_room_path(@room.id), notice: 'Room was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /rooms/1
        def destroy
          @room.destroy
          render text: 'Room was successfully destroyed.'
        end
        
        def enable
          @room.enable
          render text: 'Room was successfully active.'
        end
        
        def disable
          @room.disable
          render text: 'Room was successfully inactive.'
        end
        
        # DELETE /rooms/delete?ids=1,2,3
        def delete
          @rooms = Room.where(id: params[:ids].split(","))
          @rooms.destroy_all
          render text: 'Room(s) was successfully destroyed.'
        end
        
        # GET /rooms/select2
        def select2
          render json: Room.select2(params)
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_room
            @room = Room.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def room_params
            params.fetch(:room, {}).permit(:name, :code, :description, :hotel_id, :price, :time_line, { service_ids:[] }, room_images_attributes: [:id, :image, :_destroy])
          end
      end
    end
  end
end
