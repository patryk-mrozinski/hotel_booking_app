class Room < ApplicationRecord
  belongs_to :hotel
  has_many :booked_accommodations
  has_many :users, through: :booked_accommodations
end
