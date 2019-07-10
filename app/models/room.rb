class Room < ApplicationRecord
  include Filterable

  belongs_to :hotel
  has_one :owner, through: :hotel, source: :user
  has_many :booked_rooms
  has_many :users, through: :booked_rooms
  has_many :reservations

  search_scope :room_name, -> (name) { where('name iLIKE ?', "%#{name}%") }
  search_scope :min_price, -> (price) { where('price >= ?', price) }
  search_scope :max_price, -> (price) { where('price <= ?', price) }
  validates :name, :price, :description, presence: true

end
