class CreateNaturesoftHotelsRoomsServices < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_hotels_rooms_services do |t|
      t.references :room, index: true, references: :naturesoft_hotels_rooms
      t.references :service, index: true, references: :naturesoft_hotels_services

      t.timestamps
    end
  end
end
