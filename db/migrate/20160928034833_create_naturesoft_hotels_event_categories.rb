class CreateNaturesoftHotelsEventCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_hotels_event_categories do |t|
      t.string :name
      t.integer :level
      t.integer :parent_id
      t.text :description
      t.string :status, default: "active"
      t.references :user, index: true, references: :naturesoft_users

      t.timestamps
    end
  end
end
