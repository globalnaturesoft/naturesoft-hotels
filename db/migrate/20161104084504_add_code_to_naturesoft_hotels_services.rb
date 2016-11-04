class AddCodeToNaturesoftHotelsServices < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_hotels_services, :code, :string
  end
end
