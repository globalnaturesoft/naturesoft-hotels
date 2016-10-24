module Naturesoft
  module Hotels
    class HotelsController < Naturesoft::FrontendController
      def hotels_grid
        @hotels = Naturesoft::Hotels::Hotel.frontend_search(params)
      end
      
      def hotels_list
      end
      
      def detail
        @review = Naturesoft::Hotels::Review.new
        @detail = Naturesoft::Hotels::Hotel.find(params[:hotel_id])
      end
    end
  end
end