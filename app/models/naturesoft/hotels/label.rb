module Naturesoft::Hotels
  class Label < ApplicationRecord
    include Naturesoft::CustomOrder
    mount_uploader :icon, Naturesoft::Hotels::LabelUploader
    
    validates :name, presence: true
		
    belongs_to :user
    
    def self.sort_by
      [
        ["Custom order","naturesoft_hotels_labels.custom_order"],
        ["Name","naturesoft_hotels_labels.name"],
        ["Created At","naturesoft_hotels_labels.created_at"],
      ]
    end
    
    def self.sort_orders
      [
        ["ASC","asc"],
        ["DESC","desc"],
      ]
    end
    
    #Filter, Sort
    def self.search(params)
      records = self.all
      
      #Search keyword filter
      if params[:keyword].present?
        params[:keyword].split(" ").each do |k|
          records = records.where("LOWER(CONCAT(naturesoft_hotels_labels.name)) LIKE ?", "%#{k.strip.downcase}%") if k.strip.present?
        end
      end
      
      # for sorting
      sort_by = params[:sort_by].present? ? params[:sort_by] : "naturesoft_hotels_labels.name"
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
    
    # data for select2 ajax
    def self.select2(params)
			items = self.search(params).order("name")
			if params[:excluded].present?
				items = items.where.not(id: params[:excluded].split(","))
			end
			options = [{"id" => "", "text" => "none"}]
			options += items.map { |c| {"id" => c.id, "text" => c.name} }
			result = {"items" => options}
		end
  end
end
