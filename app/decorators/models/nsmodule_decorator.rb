Naturesoft::Nsmodule.class_eval do
  @hotels = {
    "facilities_list" => {
      "label" => "Facilities List",
      "options" => {
        "menu_id" => nil,
        "description" => nil,
        "style" => "default"
      }
    },
    "favourite_list" => {
      "label" => "Favourites List",
      "options" => {
        "description" => nil,
        "style" => "default"
      }
    },
    "hotel_by_label" => {
      "label" => "Hotel By Label",
      "options" => {
        "description" => nil,
        "label_id" => nil,
        "menu_id" => nil,
        "style" => "default"
      }
    },
    "quick_booking" => {
      "label" => "Quick Booking",
      "options" => {}
    },
    "quick_search_box" => {
      "label" => "Quick Search Box",
      "options" => {
        "menu_id" => nil,
      }
    },
  }
end