class AddDistanceFromToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :distance_from, :integer
  end
end
