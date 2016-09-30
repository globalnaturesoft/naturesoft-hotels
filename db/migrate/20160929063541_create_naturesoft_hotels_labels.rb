class CreateNaturesoftHotelsLabels < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_hotels_labels do |t|
      t.string :icon
      t.string :name
      t.text :description
      t.integer :custom_order, default: 0
      t.string :status, default: "active"
      t.references :user, index: true, references: :naturesoft_users

      t.timestamps
    end
  end
end
