class AddNaturesoftHotelsHotelTypeToNaturesoftHotelsHotels < ActiveRecord::Migration[5.0]
  def change
    change_table :naturesoft_hotels_hotels do |t|
      t.references :hotel_type, index: true, references: :naturesoft_hotels_hotel_types
    end
  end
end
