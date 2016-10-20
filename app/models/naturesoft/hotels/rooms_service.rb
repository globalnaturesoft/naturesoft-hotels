module Naturesoft::Hotels
  class RoomsService < ApplicationRecord
    belongs_to :room
    belongs_to :service
  end
end
