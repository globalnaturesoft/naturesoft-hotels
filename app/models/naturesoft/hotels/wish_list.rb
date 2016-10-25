module Naturesoft::Hotels
  class WishList < ApplicationRecord
    belongs_to :user
    belongs_to :hotel
  end
end
