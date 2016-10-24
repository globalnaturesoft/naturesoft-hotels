class CreateNaturesoftHotelsReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_hotels_reviews do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.integer :rate
      t.text :content
      t.string :status, default: "inactive"
      t.integer :user_id
      t.references :hotel, index: true, references: :naturesoft_hotels_hotels

      t.timestamps
    end
  end
end
