class Room < ApplicationRecord
  belongs_to :hotel
  has_one :owner, through: :hotel, source: :user
  has_many :booked_rooms
  has_many :users, through: :booked_rooms
end
