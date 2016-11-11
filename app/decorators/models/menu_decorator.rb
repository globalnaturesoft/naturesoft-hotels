if Naturesoft::Core.available?("menus")
  Naturesoft::Menus::Menu.class_eval do
    @hotels = {
      "hotels_grid" => {
        "label" => "Hotels Grid",
        "controller" => "/naturesoft/hotels/hotels",
        "action" => "hotels_grid",
        "params" => {
        
        }
      },
      "hotels_list" => {
        "label" => "Hotels List",
        "controller" => "/naturesoft/hotels/hotels",
        "action" => "hotels_list",
        "params" => {
        
        }
      },
      "events" => {
        "label" => "Events",
        "controller" => "/naturesoft/hotels/events",
        "action" => "hotel_listing",
        "params" => {
        
        }
      },
      "hotel_by_type" => {
        "label" => "Hotel By Type",
        "controller" => "/naturesoft/hotels/hotels",
        "action" => "hotels_grid",
        "params" => {
          "hotel_type_id" => nil,
        }
      },
      "hotel_by_areas" => {
        "label" => "Hotel By Areas",
        "controller" => "/naturesoft/areas/areas",
        "action" => "listing",
        "params" => {
          "hotel_list_id" => nil,
        }
      }
    }
  end
end