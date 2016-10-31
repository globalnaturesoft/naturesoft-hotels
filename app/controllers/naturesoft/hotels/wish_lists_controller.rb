module Naturesoft
  module Hotels
    class WishListsController < Naturesoft::FrontendController
      before_action :set_wish_list, only: [:destroy]
      
      # GET /wish_lists
      def add_item  
        if WishList.where(hotel_id: params[:hotel_id]).where(user_id: params[:user_id]).count == 0
          @wish_list = WishList.new(hotel_id: params[:hotel_id], user_id: params[:user_id])
          if @wish_list.save
            redirect_to naturesoft_hotels.hotel_detail_path(hotel_id: @wish_list.hotel_id), notice: 'WishList was successfully created.'
          end
        else
          redirect_to :back
        end
      end
      
      # DELETE /wish_lists/1
      # DELETE /wish_lists/1.json
      def destroy
        @wish_list.destroy
        redirect_to naturesoft.admin_area_path(tab: 'favorite'), notice: 'WishList was successfully removed.'
      end
      
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_wish_list
          @wish_list = WishList.find(params[:id])
        end
      
    end
  end
end
