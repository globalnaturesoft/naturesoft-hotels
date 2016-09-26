require_dependency "naturesoft/application_controller"

module Naturesoft::Hotels
  class BedTypesController < ApplicationController
    before_action :set_bed_type, only: [:show, :edit, :update, :destroy]

    # GET /bed_types
    def index
      @bed_types = BedType.all
    end

    # GET /bed_types/1
    def show
    end

    # GET /bed_types/new
    def new
      @bed_type = BedType.new
    end

    # GET /bed_types/1/edit
    def edit
    end

    # POST /bed_types
    def create
      @bed_type = BedType.new(bed_type_params)

      if @bed_type.save
        redirect_to @bed_type, notice: 'Bed type was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /bed_types/1
    def update
      if @bed_type.update(bed_type_params)
        redirect_to @bed_type, notice: 'Bed type was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /bed_types/1
    def destroy
      @bed_type.destroy
      redirect_to bed_types_url, notice: 'Bed type was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_bed_type
        @bed_type = BedType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def bed_type_params
        params.fetch(:bed_type, {})
      end
  end
end
