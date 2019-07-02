class User < ApplicationRecord
  has_many :booked_rooms, dependent: :destroy
  has_many :rooms, through: :booked_rooms
  has_many :hotel_rooms, through: :hotels, source: :rooms
  has_many :companies, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
