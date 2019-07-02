class AddCompanyReferencesToHotel < ActiveRecord::Migration[5.2]
  def change
    add_reference :hotels, :company, foreign_key: true
    add_reference :hotels, :country, foreign_key: true
  end
end
