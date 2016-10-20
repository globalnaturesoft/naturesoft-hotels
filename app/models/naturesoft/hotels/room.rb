module Naturesoft::Hotels
  class Room < ApplicationRecord
    belongs_to :user
    belongs_to :hotel
    has_many :room_images, dependent: :destroy, :inverse_of => :room
    accepts_nested_attributes_for :room_images,
				:reject_if => lambda { |a| a[:image].blank? && a[:id].blank? },
				:allow_destroy => true
		has_and_belongs_to_many :services
    
    def self.sort_by
      [
				["Created At","naturesoft_hotels_rooms.created_at"],
        ["Name","naturesoft_hotels_rooms.name"]
        
      ]
    end
    
    def self.sort_orders
      [
				["DESC","desc"],
        ["ASC","asc"]
        
      ]
    end
    
    #Filter, Sort
    def self.search(params)
      records = self.all
      
      #Search keyword filter
      if params[:keyword].present?
        params[:keyword].split(" ").each do |k|
          records = records.where("LOWER(CONCAT(naturesoft_hotels_rooms.name)) LIKE ?", "%#{k.strip.downcase}%") if k.strip.present?
        end
      end
      
      # for sorting
      sort_by = params[:sort_by].present? ? params[:sort_by] : "naturesoft_hotels_rooms.name"
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
