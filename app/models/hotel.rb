class Hotel < ApplicationRecord
  has_many :rooms, dependent: :destroy
  belongs_to :company
  belongs_to :city
end
