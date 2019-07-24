class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :post_code
      t.integer :distance_from
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
