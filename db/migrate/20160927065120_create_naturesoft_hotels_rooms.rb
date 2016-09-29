class CreateNaturesoftHotelsRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_hotels_rooms do |t|
      t.string :name
      t.string :code
      t.string :description
      t.decimal :price
      t.string :status, default: "active"
      t.references :hotel, index: true, references: :naturesoft_hotels_hotels
      t.references :user, index: true, references: :naturesoft_users

      t.timestamps
    end
  end
end
