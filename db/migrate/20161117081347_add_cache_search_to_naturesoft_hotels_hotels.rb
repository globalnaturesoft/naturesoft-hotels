class AddCacheSearchToNaturesoftHotelsHotels < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_hotels_hotels, :cache_search, :text
  end
end
