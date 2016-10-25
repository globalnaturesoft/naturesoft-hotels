class CreateNaturesoftHotelsWishLists < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_hotels_wish_lists do |t|
      t.integer :user_id
      t.integer :hotel_id

      t.timestamps
    end
  end
end
