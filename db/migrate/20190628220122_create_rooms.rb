class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.float :price
      t.text :description
      t.date :available_from
      t.date :available_to
      t.integer :number_of_guests
      t.references :hotel, foreign_key: true
      t.timestamps
    end
  end
end
