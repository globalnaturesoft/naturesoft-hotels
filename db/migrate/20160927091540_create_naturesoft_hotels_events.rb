class CreateNaturesoftHotelsEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_hotels_events do |t|
      t.string :title
      t.text :content
      t.string :image
      t.integer :custom_order, default: 0
      t.string :status, default: "active"
      t.references :event_category, index: true, references: :naturesoft_hotels_event_categories
      t.references :user, index: true, references: :naturesoft_users

      t.timestamps
    end
  end
end
