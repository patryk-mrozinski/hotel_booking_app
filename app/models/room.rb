class Room < ApplicationRecord
  belongs_to :hotel
  has_many :booked_rooms
  has_many :users, through: :booked_rooms
end
