class AddNumberOfGuestsToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :number_of_guests, :integer
  end
end
