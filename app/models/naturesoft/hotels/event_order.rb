module Naturesoft::Hotels
  class EventOrder < ApplicationRecord
    belongs_to :hotel
    belongs_to :event
    before_validation :update_event_info
    
    def update_event_info
      if self.event_name.nil?
        self.event_name = event.title
      end
      if self.event_price.nil?
        self.event_price = event.price
      end
    end
    
  end
end
