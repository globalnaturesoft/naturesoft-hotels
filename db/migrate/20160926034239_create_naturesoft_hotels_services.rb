class CreateNaturesoftHotelsServices < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_hotels_services do |t|
      t.string :name
      t.string :status, default: "active"
      t.references :user, index: true, references: :naturesoft_users

      t.timestamps
    end
  end
end
