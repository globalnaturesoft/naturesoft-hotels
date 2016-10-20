class CreateNaturesoftHotelsHotelsLabels < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_hotels_hotels_labels do |t|
      t.references :hotel, index: true, references: :naturesoft_hotels_hotels
      t.references :label, index: true, references: :naturesoft_hotels_labels

      t.timestamps
    end
  end
end
