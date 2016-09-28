class CreateNaturesoftHotelsHotelImages < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_hotels_hotel_images do |t|
      t.string :image
      t.boolean :is_main, default: false
      t.references :hotel, index: true, references: :naturesoft_hotels_hotels

      t.timestamps
    end
  end
end
