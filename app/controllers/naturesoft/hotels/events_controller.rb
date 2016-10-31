module Naturesoft
  module Hotels
    class EventsController < Naturesoft::FrontendController
      def hotel_listing
        @deals = Naturesoft::Hotels::Event.event_search(params).paginate(:page => params[:page], :per_page => 8)
      end
    end
  end
end