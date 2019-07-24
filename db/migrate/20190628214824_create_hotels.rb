class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.string :name
      t.integer :stars
      t.text :description
      t.references :city, foreign_key: true
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.references :country, foreign_key: true
      
      t.timestamps
    end
  end
end
