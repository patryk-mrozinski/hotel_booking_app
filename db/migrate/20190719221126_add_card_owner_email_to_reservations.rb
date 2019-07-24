class AddCardOwnerEmailToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :card_owner_email, :string
  end
end
