module Naturesoft::Hotels
  class Event < ApplicationRecord
    include Naturesoft::CustomOrder
    mount_uploader :image, Naturesoft::Hotels::EventUploader
    
    belongs_to :user
    belongs_to :event_category
    belongs_to :hotel
    has_many :event_orders
    
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
    
    # get event active
    def self.get_active
			self.where(status: "active").order("created_at DESC")
		end
    
    # event search - listing
    def self.event_search(params)
			records = self.get_active
			# search keyword filter
			if params[:keyword].present?
				records = records.joins(:hotel).where("LOWER(CONCAT(naturesoft_hotels_hotels.name)) LIKE ?", "%#{params[:keyword].downcase.strip}%")
			end
			# area filter
			if params[:area_id].present?
				area = Naturesoft::Areas::Area.find(params[:area_id])
				records = records.joins(:hotel => :areas).where(naturesoft_areas_areas: {id: area.get_all_related_ids})
			end
			# hotel types filter
			if params[:hotel_type_ids].present?
					records = records.joins(:hotel).where(naturesoft_hotels_hotels: { hotel_type_id: params[:hotel_type_ids] })
			end
			# hotel stars filter
			if params[:hotel_stars].present?
					records = records.joins(:hotel).where(naturesoft_hotels_hotels: { star: params[:hotel_stars] })
			end
			# hotel facilities filter
			if params[:facility_ids].present?
					records = records.joins(:hotel => :facilities).where(naturesoft_hotels_facilities: {id: params[:facility_ids]}).uniq
			end
			# hotel price filter
			if params[:prices].present?
				conds = []
				params[:prices].each do |p|
					scons = []
					scons << "(naturesoft_hotels_events.price>=#{p.split("_")[0]})"
					scons << "(naturesoft_hotels_events.price<=#{p.split("_")[1]})" if p.split("_")[1].present?
					conds << "("+scons.join(" AND ")+")"
				end
				records = records.where(conds.join(" OR "))
			end
			# hotel sort price
			if !params[:sort].nil?
				if params[:sort] == "price_asc"
					records = records.order("naturesoft_hotels_events.price ASC")
				end
				if params[:sort] == "price_desc"
					records = records.order("naturesoft_hotels_events.price DESC")
				end
			else
				records = records.order("naturesoft_hotels_events.created_at DESC")
			end
			
			return records
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
