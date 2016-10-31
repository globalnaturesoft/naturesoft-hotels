class AddContent1AndContent2AndContent3AndContent4ToNaturesoftHotelsEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_hotels_events, :content_1, :text
    add_column :naturesoft_hotels_events, :content_2, :text
    add_column :naturesoft_hotels_events, :content_3, :text
    add_column :naturesoft_hotels_events, :content_4, :text
  end
end
