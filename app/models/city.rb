class City < ApplicationRecord
  has_many :hotels, dependent: :destroy
  belongs_to :country

  validates :name, :post_code, presence: true
end
