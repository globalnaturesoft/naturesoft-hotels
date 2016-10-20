class AddLongitudeAndLatitudeAndTerms1AndTerms2AndTerms3AndTerms4AndTerms5ToNaturesoftHotelsHotels < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_hotels_hotels, :longtitude, :string
    add_column :naturesoft_hotels_hotels, :latitude, :string
    add_column :naturesoft_hotels_hotels, :terms_1, :text
    add_column :naturesoft_hotels_hotels, :terms_2, :text
    add_column :naturesoft_hotels_hotels, :terms_3, :text
    add_column :naturesoft_hotels_hotels, :terms_4, :text
    add_column :naturesoft_hotels_hotels, :terms_5, :text
  end
end
