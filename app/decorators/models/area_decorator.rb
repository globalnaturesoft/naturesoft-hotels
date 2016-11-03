if Naturesoft::Core.available?("areas")
    Naturesoft::Areas::Area.class_eval do
        has_and_belongs_to_many :areas, class_name: 'Naturesoft::Areas::Area', :join_table => 'naturesoft_hotels_areas_hotels'
    end
end