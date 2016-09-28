class CreateNaturesoftHotelsHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_hotels_hotels do |t|
      t.string :image
      t.string :name
      t.string :address
      t.string :position
      t.string :description
      t.decimal :from_per_night
      t.integer :star
      t.string :status, default: "active"
      
      t.references :user, index: true, references: :naturesoft_users

      t.timestamps
    end
  end
end
