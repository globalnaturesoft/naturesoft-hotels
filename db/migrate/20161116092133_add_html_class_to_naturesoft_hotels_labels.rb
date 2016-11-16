class AddHtmlClassToNaturesoftHotelsLabels < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_hotels_labels, :html_class, :string
  end
end
