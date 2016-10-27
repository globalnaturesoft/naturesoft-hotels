module Naturesoft::Hotels
  class WishList < ApplicationRecord
    belongs_to :user
    belongs_to :hotel
    
    def self.check_present(hotel_id, user_id)
      self.where(hotel_id: hotel_id).where(user_id: user_id)
    end
  end
end
