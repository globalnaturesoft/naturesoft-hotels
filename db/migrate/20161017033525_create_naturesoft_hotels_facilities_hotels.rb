class CreateNaturesoftHotelsFacilitiesHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_hotels_facilities_hotels do |t|
      t.references :facility, index: true, references: :naturesoft_hotels_facilities
      t.references :hotel, index: true, references: :naturesoft_hotels_hotels

      t.timestamps
    end
  end
end
