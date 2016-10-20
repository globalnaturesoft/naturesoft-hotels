module Naturesoft::Hotels
  class HotelImage < ApplicationRecord
    mount_uploader :image, Naturesoft::Hotels::HotelUploader
    belongs_to :hotel
    after_save :recreate_thumbs
    
    def recreate_thumbs
			self.image.recreate_versions!
		end
  end
end
