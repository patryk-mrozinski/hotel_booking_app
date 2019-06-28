class User < ApplicationRecord
  has_many :booked_accommodations
  has_many :rooms, through: :booked_accommodations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
