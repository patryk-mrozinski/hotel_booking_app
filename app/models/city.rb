class City < ApplicationRecord
  has_many :hotels, dependent: :destroy
  belongs_to :countries
end
