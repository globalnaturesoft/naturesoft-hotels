module Naturesoft::Hotels
  class RoomImage < ApplicationRecord
    mount_uploader :image, Naturesoft::Hotels::HotelUploader
    belongs_to :room
  end
end
