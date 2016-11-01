class CreateNaturesoftHotelsEventOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_hotels_event_orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.datetime :checkin
      t.datetime :checkout
      t.string :event_name
      t.string :event_price
      t.integer :number
      t.text :note
      t.integer :user_id
      t.references :hotel, index: true, references: :naturesoft_hotels_hotels
      t.references :event, index: true, references: :naturesoft_hotels_events

      t.timestamps
    end
  end
end