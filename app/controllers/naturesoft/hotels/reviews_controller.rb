module Naturesoft
  module Hotels
    class ReviewsController < Naturesoft::FrontendController
      
      # POST /reviews
      def create
        @review = Review.new(review_params)
        @review.user = current_user
        if @review.save
          redirect_to naturesoft_hotels.hotel_detail_path(hotel_id: @review.hotel_id), notice: 'Review was successfully created.'
        else
          render :new
        end
      end
      
      private
        # Only allow a trusted parameter "white list" through.
        def review_params
          params.require(:review).permit(:first_name, :last_name, :email, :phone, :rate, :content, :user_id, :hotel_id)
        end
    end
  end
end
