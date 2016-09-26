Naturesoft::Hotels::Engine.routes.draw do
  namespace :admin, module: "admin", path: "admin/hotels" do
    resources :room_types do
      collection do
        put "enable"
        put "disable"
        delete "delete"
      end
    end
    resources :bed_types do
      collection do
        put "enable"
        put "disable"
        delete "delete"
      end
    end
  end
end