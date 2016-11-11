if Naturesoft::Core.available?("areas")
    Naturesoft::Areas::Area.class_eval do
        has_and_belongs_to_many :hotels, class_name: 'Naturesoft::Hotels::Hotel', :join_table => 'naturesoft_hotels_areas_hotels'
    end
end