class Company < ApplicationRecord
  belongs_to :user
  has_many :hotels
  after_commit :set_has_company, on: :create

  private

  def set_has_company
    user.update(has_company: true) unless user.has_company
  end
end
