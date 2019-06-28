class Room < ApplicationRecord
  belongs_to :hotels
  has_many :booked_accommodations
  has_many :users, through: :booked_accommodations
end
