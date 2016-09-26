Naturesoft::Hotels::Engine.routes.draw do
  namespace :admin, module: "admin", path: "admin/hotels" do
    resources :services do
      collection do
        put "enable"
        put "disable"
        delete "delete"
        get "select2"
      end
    end
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