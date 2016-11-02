module Naturesoft
  module Hotels
    class ReviewsController < Naturesoft::FrontendController
      
      # POST /reviews
      def create
        @review = Review.new(review_params)
        
        if @review.save
					respond_to do |format|
						format.html {
							redirect_to naturesoft_hotels.hotel_detail_path(hotel_id: @review.hotel_id), notice: 'Review was successfully created.'
						}
						format.json {
							render json: {
								title: t(:success),
								message: t(:review_success)
							}
						}
					end
				else
          render :new
        end
      end
      
      private
        # Only allow a trusted parameter "white list" through.
        def review_params
          params.require(:review).permit(:first_name, :last_name, :email, :phone, :rate, :content, :hotel_id, :user_id)
        end
    end
  end
end
