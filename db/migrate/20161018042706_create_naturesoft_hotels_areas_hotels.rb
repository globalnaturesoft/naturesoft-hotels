class CreateNaturesoftHotelsAreasHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_hotels_areas_hotels do |t|
      t.references :area, index: true, references: :naturesoft_areas_areas
      t.references :hotel, index: true, references: :naturesoft_hotels_hotels

      t.timestamps
    end
  end
end
