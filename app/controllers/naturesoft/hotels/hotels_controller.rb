module Naturesoft
  module Hotels
    class HotelsController < Naturesoft::FrontendController
      def hotels_grid
        @hotels = Naturesoft::Hotels::Hotel.frontend_search(params).paginate(:page => params[:page], :per_page => 8)
      end
      
      def hotels_list
        @hotels = Naturesoft::Hotels::Hotel.frontend_search(params).paginate(:page => params[:page], :per_page => 6)
      end
      
      def detail
        @review = Naturesoft::Hotels::Review.new
        @order = Naturesoft::Hotels::Order.new
        @detail = Naturesoft::Hotels::Hotel.find(params[:hotel_id])
      end
      
      # GET /reviews/list
      def reviews_list
        @hotel = Hotel.find(params[:id])
      end
    end
  end
end