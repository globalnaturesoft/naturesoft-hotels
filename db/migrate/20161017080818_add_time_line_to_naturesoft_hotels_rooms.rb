class AddTimeLineToNaturesoftHotelsRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_hotels_rooms, :time_line, :string
  end
end
