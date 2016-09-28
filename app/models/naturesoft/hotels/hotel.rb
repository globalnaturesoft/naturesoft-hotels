module Naturesoft::Hotels
  class Hotel < ApplicationRecord
		mount_uploader :image, Naturesoft::Hotels::HotelUploader
    belongs_to :user
    has_many :rooms, dependent: :destroy, :inverse_of => :hotel
    has_many :hotel_images, dependent: :destroy, :inverse_of => :hotel
    accepts_nested_attributes_for :hotel_images,
				:reject_if => lambda { |a| a[:image].blank? && a[:id].blank? },
				:allow_destroy => true
    
    def self.sort_by
      [
        ["Name","naturesoft_hotels_hotels.name"],
        ["Created At","naturesoft_hotels_hotels.created_at"]
      ]
    end
    
    def self.sort_orders
      [
        ["ASC","asc"],
        ["DESC","desc"]
      ]
    end
    
    #Filter, Sort
    def self.search(params)
      records = self.all
      
      #Search keyword filter
      if params[:keyword].present?
        params[:keyword].split(" ").each do |k|
          records = records.where("LOWER(CONCAT(naturesoft_hotels_hotels.name)) LIKE ?", "%#{k.strip.downcase}%") if k.strip.present?
        end
      end
      
      # for sorting
      sort_by = params[:sort_by].present? ? params[:sort_by] : "naturesoft_hotels_hotels.name"
      sort_orders = params[:sort_orders].present? ? params[:sort_orders] : "desc"
      records = records.order("#{sort_by} #{sort_orders}")
      
      return records
    end
    
    # enable/disable status
    def enable
			update_columns(status: "active")
		end
    
    def disable
			update_columns(status: "inactive")
		end
    
    # data for select2 ajax
    def self.select2(params)
			items = self.search(params)
			if params[:excluded].present?
				items = items.where.not(id: params[:excluded].split(","))
			end
			options = [{"id" => "", "text" => "none"}]
			options += items.map { |c| {"id" => c.id, "text" => c.name} }
			result = {"items" => options}
		end
  end
end
