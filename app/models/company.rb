class Company < ApplicationRecord
  belongs_to :user
  has_many :hotels
  after_commit :set_has_company, on: :create

  validates :name, :p_number, :company_email, :address, :company_serial,
            presence: true, length: { minimum: 3 }
  validates :name, :company_email, :company_serial, uniqueness: { case_sensitive: false }

  private

  def set_has_company
    user.update(has_company: true) unless user.has_company
  end
end
