module Naturesoft
  module Hotels
    module Backend
      class HotelsController < Naturesoft::Backend::BackendController
        before_action :set_hotel, only: [:show, :edit, :update, :enable, :disable, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Hotel", naturesoft_hotels.backend_hotels_path
          add_breadcrumb "Hotels", naturesoft_hotels.backend_hotels_path
        end
    
        # GET /hotels
        def index
          @hotels = Hotel.search(params).paginate(:page => params[:page], :per_page => Naturesoft::Option.get("hotels", "hotels_items_per_page"))
        end
    
        # GET /hotels/1
        def show
        end
    
        # GET /hotels/new
        def new
          @hotel = Hotel.new
          add_breadcrumb "New Hotel", nil,  class: "active"
        end
    
        # GET /hotels/1/edit
        def edit
          add_breadcrumb "New Hotel", nil,  class: "active"
        end
    
        # POST /hotels
        def create
          @hotel = Hotel.new(hotel_params)
          @hotel.user = current_user
    
          if @hotel.save
            redirect_to naturesoft_hotels.edit_backend_hotel_path(@hotel.id), notice: 'Hotel was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /hotels/1
        def update
          @hotel.areas.clear
          @hotel.labels.clear
          @hotel.facilities.clear
          
          if @hotel.update(hotel_params)
            redirect_to naturesoft_hotels.edit_backend_hotel_path(@hotel.id), notice: 'Hotel was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /hotels/1
        def destroy
          @hotel.destroy
          render text: 'Hotel was successfully destroyed.'
        end
        
        def enable
          @hotel.enable
          render text: 'Hotel was successfully active.'
        end
        
        def disable
          @hotel.disable
          render text: 'Hotel was successfully inactive.'
        end
        
        # DELETE /hotels/delete?ids=1,2,3
        def delete
          @bed_types = Hotel.where(id: params[:ids].split(","))
          @bed_types.destroy_all
          render text: 'Hotel(s) was successfully destroyed.'
        end
        
        # GET /hotels/select2
        def select2
          render json: Hotel.select2(params)
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_hotel
            @hotel = Hotel.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def hotel_params
            params.fetch(:hotel, {}).permit(:image, :name, :address, :position, :description, :from_per_night, :star, :meta_keywords, :meta_description, :hotel_type_id, :longtitude, :latitude, :terms_1, :terms_2, :terms_3, :terms_4, :terms_5, { area_ids:[] }, { label_ids:[] }, { facility_ids:[] }, hotel_images_attributes: [:id, :image, :title, :is_main, :_destroy])
          end
      end
    end
  end
end
