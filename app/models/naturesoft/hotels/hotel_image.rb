module Naturesoft::Hotels
  class HotelImage < ApplicationRecord
    mount_uploader :image, Naturesoft::Hotels::HotelUploader
    belongs_to :hotel
  end
end
