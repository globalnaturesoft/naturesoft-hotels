class CreateNaturesoftHotelsQuickOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_hotels_quick_orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :message
      t.string :status, default: "active"

      t.timestamps
    end
  end
end
