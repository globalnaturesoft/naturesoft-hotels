module Naturesoft
  module Hotels
    module Admin
      class ReviewsController < Naturesoft::Admin::AdminController
        before_action :set_review, only: [:show, :edit, :update, :enable, :disable, :destroy]
        before_action :default_breadcrumb
            
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Hotel", naturesoft_hotels.admin_reviews_path
          add_breadcrumb "Reviews", naturesoft_hotels.admin_reviews_path
        end
            
        # GET /reviews
        def index
          @reviews = Review.search(params).paginate(:page => params[:page], :per_page => 10)
        end
    
        ## GET /reviews/1
        #def show
        #end
        #
        ## GET /reviews/new
        #def new
        #  @review = Review.new
        #  add_breadcrumb "New Review", nil,  class: "active"
        #end
        #
        ## GET /reviews/1/edit
        #def edit
        #  add_breadcrumb "Edit Review", nil,  class: "active"
        #end
        #
        ## POST /reviews
        #def create
        #  @review = Review.new(review_params)
        #  @review.user = current_user
        #
        #  if @review.save
        #    redirect_to naturesoft_hotels.edit_admin_review_path(@review.id), notice: 'Review was successfully created.'
        #  else
        #    render :new
        #  end
        #end
        #
        ## PATCH/PUT /reviews/1
        #def update
        #  if @review.update(review_params)
        #    redirect_to naturesoft_hotels.edit_admin_review_path(@review.id), notice: 'Review was successfully updated.'
        #  else
        #    render :edit
        #  end
        #end
    
        # DELETE /reviews/1
        def destroy
          @review.destroy
          render text: 'Review was successfully destroyed.'
        end
        
        def enable
          @review.enable
          render text: 'Review was successfully active.'
        end
        
        def disable
          @review.disable
          render text: 'Review was successfully inactive.'
        end
        
        # DELETE /rooms/delete?ids=1,2,3
        def delete
          @reviews = Review.where(id: params[:ids].split(","))
          @reviews.destroy_all
          render text: 'Review(s) was successfully destroyed.'
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_review
            @review = Review.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def review_params
            params.require(:review).permit(:first_name, :last_name, :email, :phone, :rate, :content, :room_id, :hotel_id)
          end
      end
    end
  end
end
