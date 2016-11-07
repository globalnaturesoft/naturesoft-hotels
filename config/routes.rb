Naturesoft::Hotels::Engine.routes.draw do
  namespace :backend, module: "backend", path: "backend/hotels" do
    resources :hotels do
      collection do
        put "enable"
        put "disable"
        delete "delete"
        get "select2"
      end
    end
    resources :event_orders do
      collection do
        put "enable"
        put "disable"
        delete "delete"
      end
    end
    resources :reviews do
      collection do
        put "enable"
        put "disable"
        delete "delete"
      end
    end
    resources :orders do
      collection do
        put "enable"
        put "disable"
        delete "delete"
      end
    end
    resources :rooms do
      collection do
        put "enable"
        put "disable"
        delete "delete"
        get "select2"
      end
    end
    resources :services do
      collection do
        put "enable"
        put "disable"
        delete "delete"
        get "select2"
      end
    end
    resources :facilities do
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
        get "select2"
      end
    end
    resources :bed_types do
      collection do
        put "enable"
        put "disable"
        delete "delete"
        get "select2"
      end
    end
    resources :events do
      collection do
        put "enable"
        put "disable"
        delete "delete"
      end
    end
    resources :event_categories do
      collection do
        put "enable"
        put "disable"
        delete "delete"
        get "select2"
      end
    end
    resources :labels do
      collection do
        put "enable"
        put "disable"
        delete "delete"
        get "select2"
      end
    end
    resources :hotel_types do
      collection do
        put "enable"
        put "disable"
        delete "delete"
        get "select2"
      end
    end
    resources :quick_orders do
      collection do
        put "enable"
        put "disable"
        delete "delete"
      end
    end
  end
end