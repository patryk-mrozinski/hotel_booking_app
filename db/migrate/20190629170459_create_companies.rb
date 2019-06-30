class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :p_number
      t.string :address
      t.string :company_email
      t.integer :company_serial

      t.timestamps
    end
  end
end
