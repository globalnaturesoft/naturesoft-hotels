class AddPriceToNaturesoftHotelsEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_hotels_events, :price, :decimal
  end
end
