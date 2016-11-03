module Naturesoft::Hotels
  class EventOrder < ApplicationRecord
		validates :first_name, :last_name, :email, :phone, :number, :checkin, :checkout, :hotel_id, :event_id, presence: true
    belongs_to :hotel
    belongs_to :event
    before_validation :update_event_info
    
    def update_event_info
      if self.event_name.nil?
        self.event_name = event.title
      end
      if self.event_price.nil?
        self.event_price = event.price
      end
    end
    
    def self.sort_by
      [
				["Created At","naturesoft_hotels_event_orders.created_at"]
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
          records = records.where("LOWER(CONCAT(naturesoft_hotels_event_orders.last_name)) LIKE ?", "%#{k.strip.downcase}%") if k.strip.present?
        end
      end
      
      # for sorting
      sort_by = params[:sort_by].present? ? params[:sort_by] : "naturesoft_hotels_event_orders.last_name"
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
  end
end
