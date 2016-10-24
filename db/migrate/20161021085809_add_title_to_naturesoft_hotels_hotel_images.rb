class AddTitleToNaturesoftHotelsHotelImages < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_hotels_hotel_images, :title, :string
  end
end
