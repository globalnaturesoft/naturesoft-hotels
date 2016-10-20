module Naturesoft::Hotels
  class HotelsLabel < ApplicationRecord
    belongs_to :hotel
    belongs_to :label
  end
end
