class AddCodeToNaturesoftHotelsFacilities < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_hotels_facilities, :code, :string
  end
end
