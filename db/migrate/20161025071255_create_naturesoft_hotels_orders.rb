class CreateNaturesoftHotelsOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_hotels_orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :tel
      t.datetime :checkin
      t.datetime :checkout
      t.integer :adult, default: 1
      t.integer :child, default: 0
      t.text :note
      t.integer :user_id
      t.string :status, default: "inactive"
      t.references :room, index: true, references: :naturesoft_hotels_rooms
      t.references :hotel, index: true, references: :naturesoft_hotels_hotels

      t.timestamps
    end
  end
end
