Naturesoft::User.class_eval do
    has_many :hotels_orders, class_name: 'Naturesoft::Hotels::Order'
end