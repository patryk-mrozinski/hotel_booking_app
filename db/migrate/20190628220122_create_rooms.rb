class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.string :picture
      t.date :available_from
      t.date :available_to
      t.references :hotel, foreign_key: true

      t.timestamps
    end
  end
end
