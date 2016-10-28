module Naturesoft::Hotels
  class Event < ApplicationRecord
    include Naturesoft::CustomOrder
    mount_uploader :image, Naturesoft::Hotels::EventUploader
    
    belongs_to :user
    belongs_to :event_category
    belongs_to :hotel
    
    validates :title, presence: true
		validates :image, presence: true
    validates :image, allow_blank: true, format: {
			with: %r{\.(gif|jpg|png)\Z}i,
			message: 'must be a URL for GIF, JPG or PNG image.'
		}
    
    def self.sort_by
      [
				["Custom order","naturesoft_hotels_events.custom_order"],
        ["Title","naturesoft_hotels_events.title"],
        ["Created At","naturesoft_hotels_events.created_at"]
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
      
      if params[:scale].present?
        records = records.where(image_scale: params[:scale])
      end
      
      #Search keyword filter
      if params[:keyword].present?
        params[:keyword].split(" ").each do |k|
          records = records.where("LOWER(CONCAT(naturesoft_hotels_events.title,' ',naturesoft_hotels_events.content)) LIKE ?", "%#{k.strip.downcase}%") if k.strip.present?
        end
      end
      
      # for sorting
      sort_by = params[:sort_by].present? ? params[:sort_by] : "naturesoft_hotels_events.title"
      sort_orders = params[:sort_orders].present? ? params[:sort_orders] : "asc"
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
