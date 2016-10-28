class AddNaturesoftHotelsHotelToNaturesoftHotelsEvents < ActiveRecord::Migration[5.0]
  def change
    change_table :naturesoft_hotels_events do |t|
      t.references :hotel, index: true, references: :naturesoft_hotels_hotels
    end
  end
end
