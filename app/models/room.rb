class Room < ApplicationRecord
  belongs_to :hotel
  has_one :owner, through: :hotel, source: :user
  has_many :booked_rooms
  has_many :users, through: :booked_rooms

  validates :name, :price, :description, presence: true

  scope :filter, -> (room){ where(available_between)} 

  def available_between
    self.available_from...self.available_to
  end
end
