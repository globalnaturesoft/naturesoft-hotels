module Naturesoft
  module Hotels
    module Admin
      class EventCategoriesController < Naturesoft::Admin::AdminController
        before_action :set_event_category, only: [:show, :edit, :update, :destroy, :enable, :disable]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Event Category", naturesoft_hotels.admin_event_categories_path
        end
    
        # GET /event_categories
        def index
          @event_categories = EventCategory.search(params).paginate(:page => params[:page], :per_page => Naturesoft::Option.get("hotels", "event_categories_items_per_page"))
        end
    
        # GET /event_categories/1
        def show
        end
    
        # GET /event_categories/new
        def new
          @event_category = EventCategory.new
          add_breadcrumb "New Event Category", nil,  class: "active"
        end
    
        # GET /event_categories/1/edit
        def edit
          add_breadcrumb "Edit Event Category", nil,  class: "active"
        end
    
        # POST /event_categories
        def create
          @event_category = EventCategory.new(event_category_params)
          @event_category.user = current_user
    
          if @event_category.save
            redirect_to naturesoft_hotels.edit_admin_event_category_path(@event_category.id), notice: 'Event category was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /event_categories/1
        def update
          if @event_category.update(event_category_params)
            redirect_to naturesoft_hotels.edit_admin_event_category_path(@event_category.id), notice: 'Event category was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /event_categories/1
        def destroy
          @event_category.destroy
          render text: 'Event category was successfully destroyed.'
        end
        
        #CHANGE STATUS /event_categories
        def enable
          @event_category.enable
          render text: 'Event category was successfully active.'
        end
        
        def disable
          @event_category.disable
          render text: 'Event category was successfully inactive.'
        end
        
        # DELETE /event_categories/delete?ids=1,2,3
        def delete
          @event_categories = EventCategory.where(id: params[:ids].split(","))
          @event_categories.destroy_all
          render text: 'Event categor(y/ies) was successfully destroyed.'
        end
        
        # GET /event_categories/select2
        def select2
          render json: EventCategory.select2(params)
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_event_category
            @event_category = EventCategory.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def event_category_params
            params.fetch(:event_category, {}).permit(:name, :description, :parent_id)
          end
      end
    end
  end
end
