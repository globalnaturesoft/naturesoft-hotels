module Naturesoft::Hotels
  class AreasHotel < ApplicationRecord
    belongs_to :area
    belongs_to :hotel
  end
end
