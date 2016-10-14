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
      }
    }
  end
end