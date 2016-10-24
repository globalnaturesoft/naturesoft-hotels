module Naturesoft::Hotels
  class QuickOrder < ApplicationRecord
    validates :first_name, :last_name, :email, :phone, :message, presence: true
    
    def self.sort_by
      [
        ["Created At","naturesoft_hotels_quick_orders.created_at"],
      ]
    end
    
    def self.sort_orders
      [
        ["DESC","desc"],
        ["ASC","asc"],
      ]
    end
    
    #Filter, Sort
    def self.search(params)
      records = self.all
      
      #Search keyword filter
      if params[:keyword].present?
        params[:keyword].split(" ").each do |k|
          records = records.where("LOWER(CONCAT(naturesoft_hotels_quick_orders.first_name,'',naturesoft_hotels_quick_orders.last_name,'',naturesoft_hotels_quick_orders.phone,'',naturesoft_hotels_quick_orders.email)) LIKE ?", "%#{k.strip.downcase}%") if k.strip.present?
        end
      end
      
      # for sorting
      sort_by = params[:sort_by].present? ? params[:sort_by] : "naturesoft_hotels_quick_orders.email"
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
