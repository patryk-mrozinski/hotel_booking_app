class Country < ApplicationRecord
  has_many :cities, dependent: :destroy
  has_many :hotels

  validates :name, :abbreviation, presence: true, uniqueness: { case_sensitive: false }
end
