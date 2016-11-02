class AddStatusToNaturesoftHotelsEventOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_hotels_event_orders, :status, :string, default: "inactive"
  end
end
