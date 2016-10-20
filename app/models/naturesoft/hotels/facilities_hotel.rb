module Naturesoft::Hotels
  class FacilitiesHotel < ApplicationRecord
    belongs_to :facility
    belongs_to :hotel
  end
end
