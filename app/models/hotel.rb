class Hotel < ApplicationRecord
  include Filterable
  has_many :rooms, dependent: :destroy
  belongs_to :company
  belongs_to :city

  search_scope :stars, -> (stars) { where stars: stars }
  search_scope :city_name, -> (name) { joins(:city).where('cities.name iLIKE ?', "%#{name}%") }
  search_scope :hotel_name, -> (name) { where('name iLIKE ?', "%#{name}%") }

  validates :name, :stars, :description, presence: true
end
