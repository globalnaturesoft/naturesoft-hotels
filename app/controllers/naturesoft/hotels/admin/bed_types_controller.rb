module Naturesoft
  module Hotels
    module Admin
      class BedTypesController < Naturesoft::Admin::AdminController
        before_action :set_bed_type, only: [:show, :edit, :update, :enable, :disable, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Hotel", naturesoft_hotels.admin_bed_types_path
          add_breadcrumb "Bed Types", naturesoft_hotels.admin_bed_types_path
        end
        
        # GET /bed_types
        def index
          @bed_types = BedType.search(params).paginate(:page => params[:page], :per_page => Naturesoft::Option.get("hotels", "bed_types_items_per_page"))
        end
    
        # GET /bed_types/1
        def show
        end
    
        # GET /bed_types/new
        def new
          @bed_type = BedType.new
          add_breadcrumb "New Bed Type", nil,  class: "active"
        end
    
        # GET /bed_types/1/edit
        def edit
          add_breadcrumb "Edit Bed Type", nil,  class: "active"
        end
    
        # POST /bed_types
        def create
          @bed_type = BedType.new(bed_type_params)
          @bed_type.user = current_user
    
          if @bed_type.save
            redirect_to naturesoft_hotels.edit_admin_bed_type_path(@bed_type.id), notice: 'Bed type was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /bed_types/1
        def update
          if @bed_type.update(bed_type_params)
            redirect_to naturesoft_hotels.edit_admin_bed_type_path(@bed_type.id), notice: 'Bed type was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /bed_types/1
        def destroy
          @bed_type.destroy
          render text: 'Bed type was successfully destroyed.'
        end
        
        def enable
          @bed_type.enable
          render text: 'Bed type was successfully active.'
        end
        
        def disable
          @bed_type.disable
          render text: 'Bed type was successfully inactive.'
        end
        
        # DELETE /bed_types/delete?ids=1,2,3
        def delete
          @bed_types = BedType.where(id: params[:ids].split(","))
          @bed_types.destroy_all
          render text: 'Bed types(s) was successfully destroyed.'
        end
        
        # GET /bed_types/select2
        def select2
          render json: BedType.select2(params)
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_bed_type
            @bed_type = BedType.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def bed_type_params
            params.fetch(:bed_type, {}).permit(:name, :status)
          end
      end
    end
  end
end
