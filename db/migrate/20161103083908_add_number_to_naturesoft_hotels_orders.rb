class AddNumberToNaturesoftHotelsOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_hotels_orders, :number, :integer
  end
end
