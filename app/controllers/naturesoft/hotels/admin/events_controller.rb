module Naturesoft
  module Hotels
    module Admin
      class EventsController < Naturesoft::Admin::AdminController
        before_action :set_event, only: [:show, :edit, :update, :destroy, :enable, :disable]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Event", naturesoft_hotels.admin_events_path
        end
    
        # GET /events
        def index
          @events = Event.search(params).paginate(:page => params[:page], :per_page => Naturesoft::Option.get("hotels", "events_items_per_page"))
        end
    
        # GET /events/1
        def show
        end
    
        # GET /events/new
        def new
          @event = Event.new
          add_breadcrumb "New Event", nil,  class: "active"
        end
    
        # GET /events/1/edit
        def edit
          add_breadcrumb "Edit Event", nil,  class: "active"
        end
    
        # POST /events
        def create
          @event = Event.new(event_params)
          @event.user = current_user
    
          if @event.save
            redirect_to naturesoft_hotels.edit_admin_event_path(@event.id), notice: 'Event was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /events/1
        def update
          if @event.update(event_params)
            redirect_to naturesoft_hotels.edit_admin_event_path(@event.id), notice: 'Event was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /events/1
        def destroy
          @event.destroy
          render text: 'Event was successfully destroyed.'
        end
        
        #CHANGE STATUS /events
        def enable
          @event.enable
          render text: 'Event was successfully active.'
        end
        
        def disable
          @event.disable
          render text: 'Event was successfully inactive.'
        end
        
        # DELETE /events/delete?ids=1,2,3
        def delete
          @events = Event.where(id: params[:ids].split(","))
          @events.destroy_all
          render text: 'Event(s) was successfully destroyed.'
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_event
            @event = Event.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def event_params
            params.fetch(:event, {}).permit(:title, :price, :content, :content_1, :content_2, :content_3, :content_4, :image, :event_category_id, :hotel_id)
          end
      end
    end
  end
end
