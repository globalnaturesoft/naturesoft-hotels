class AddMetaKeywordsAndMetaDescriptionToNaturesoftHotelsHotels < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_hotels_hotels, :meta_keywords, :string
    add_column :naturesoft_hotels_hotels, :meta_description, :string
  end
end
