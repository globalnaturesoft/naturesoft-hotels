module Naturesoft::Hotels
  class Hotel < ApplicationRecord
		mount_uploader :image, Naturesoft::Hotels::HotelUploader
		validate :at_least_one_area, :at_least_one_label, :at_least_one_facility
		
    belongs_to :user
    has_many :rooms, dependent: :destroy, :inverse_of => :hotel
    has_many :hotel_images, dependent: :destroy, :inverse_of => :hotel
    has_many :reviews, dependent: :destroy, :inverse_of => :hotel
    has_many :events, dependent: :destroy, :inverse_of => :hotel
    has_many :event_orders, dependent: :destroy, :inverse_of => :hotel
    accepts_nested_attributes_for :hotel_images,
				:reject_if => lambda { |a| a[:image].blank? && a[:id].blank? },
				:allow_destroy => true
		has_and_belongs_to_many :facilities
		has_and_belongs_to_many :labels, :join_table => 'naturesoft_hotels_hotels_labels'
		belongs_to :hotel_type
		
		def at_least_one_area
			errors.add(:base, 'must add at least one area') if self.areas.blank?
		end
		
		def at_least_one_label
			errors.add(:base, 'must add at least one label') if self.labels.blank?
		end
		
		def at_least_one_facility
			errors.add(:base, 'must add at least one facility') if self.facilities.blank?
		end
		
		def get_main_image
			self.hotel_images.where(is_main: true).first
		end
		
		def get_extra_images
			self.hotel_images.where(is_main: false).order("created_at asc")
		end
		
		def self.get_hotel_stars(star)
			self.where(star: star).count
		end
    
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
    
    # get tour active
    def self.get_active
			self.where(status: "active")
		end
    
    # get main image for tours
    def get_main_image
			image = hotel_images.where(is_main: "True").order("updated_at DESC").first
		end
    
    def avg_reviews
			if reviews.count > 0
				avg = reviews.get_active.sum(:rate)/reviews.get_active.count
				return (avg*2).round(2)
			else
				return 0	
			end
		end
    
    def rating_reviews
			avg = self.avg_reviews
			if avg >= 0 and avg < 2
				return "Không tốt lắm"
			end
			if avg >= 2 and avg < 4
				return "Tạm chấp nhận"
			end
			if avg >= 4 and avg < 6
				return "Tốt"
			end
			if avg >= 6 and avg < 8
				return "Rất tốt"
			end
			if avg >= 8 and avg <= 10
				return "Tuyệt vời"
			end
		end
    
    # frontend search - listing
    def self.frontend_search(params)
			records = self.get_active
			# search keyword filter
			if params[:keyword].present?
				records = records.where("LOWER(CONCAT(naturesoft_hotels_hotels.name)) LIKE ?", "%#{params[:keyword].downcase.strip}%")
			end
			# area filter
			if params[:area_id].present?
				area = Naturesoft::Areas::Area.find(params[:area_id])
				records = records.joins(:areas).where(naturesoft_areas_areas: {id: area.get_all_related_ids})
			end
			# label filter
			if params[:label_id].present?
					records = records.joins(:labels).where(naturesoft_hotels_labels: {id: params[:label_id]})
			end
			# hotel types filter
			if params[:hotel_type_ids].present?
					records = records.where(hotel_type_id: params[:hotel_type_ids])
			end
			# hotel stars filter
			if params[:hotel_stars].present?
					records = records.where(star: params[:hotel_stars])
			end
			# hotel facilities filter
			if params[:facility_ids].present?
					records = records.joins(:facilities).where(naturesoft_hotels_facilities: {id: params[:facility_ids]}).uniq
			end
			# hotel price filter
			if params[:prices].present?
				conds = []
				params[:prices].each do |p|
					scons = []
					scons << "(naturesoft_hotels_hotels.from_per_night>=#{p.split("_")[0]})"
					scons << "(naturesoft_hotels_hotels.from_per_night<=#{p.split("_")[1]})" if p.split("_")[1].present?
					conds << "("+scons.join(" AND ")+")"
				end
				records = records.where(conds.join(" OR "))
			end
			# hotel sort price
			if !params[:sort].nil?
				if params[:sort] == "price_asc"
					records = records.order("naturesoft_hotels_hotels.from_per_night ASC")
				end
				if params[:sort] == "price_desc"
					records = records.order("naturesoft_hotels_hotels.from_per_night DESC")
				end
			else
				records = records.order("naturesoft_hotels_hotels.created_at DESC")
			end
			#hotel sort review
			
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
    
    # get all products
    def self.get_all_hotels
			self.where(status: "active")
		end
    
    # get favourite hotels
    def self.get_favourite_hotels(params)
			self.get_all_hotels.limit(6)
		end
  end
end
