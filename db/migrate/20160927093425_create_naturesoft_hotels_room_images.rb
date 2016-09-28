class CreateNaturesoftHotelsRoomImages < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_hotels_room_images do |t|
      t.string :image
      t.references :room, index: true, references: :naturesoft_hotels_rooms

      t.timestamps
    end
  end
end
