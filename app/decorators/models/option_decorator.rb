Naturesoft::Option.class_eval do
  @hotels = {
    "hotels_items_per_page" => 10,
    "rooms_items_per_page" => 10,
    "facilities_items_per_page" => 10,
    "services_items_per_page" => 10,
    "bed_types_items_per_page" => 10,
    "room_types_items_per_page" => 10,
    "events_items_per_page" => 10,
    "event_categories_items_per_page" => 10,
    "labels_items_per_page" => 10,
    "thumbnails" => {
      "0" => {
        "code" => "big",
        "width" => "500",
        "height" => "500",
        "scale" => "fit"
      },
      "1" => {
        "code" => "medium",
        "width" => "160",
        "height" => "160",
        "scale" => "fill"
      },
      "2" => {
        "code" => "small",
        "width" => "80",
        "height" => "80",
        "scale" => "fill"
      }
    },
    "event_thumbnails" => {
      "0" => {
        "code" => "big",
        "width" => "500",
        "height" => "500",
        "scale" => "fit"
      },
      "1" => {
        "code" => "medium",
        "width" => "160",
        "height" => "160",
        "scale" => "fill"
      },
      "2" => {
        "code" => "small",
        "width" => "80",
        "height" => "80",
        "scale" => "fill"
      }
    },
    "quick_order_announce_email" => nil,
  }
end