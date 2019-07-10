class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :room, foreign_key: true
      t.date :reservation_from
      t.date :reservation_to
    end
  end
end
