class User < ApplicationRecord
  has_many :companies, dependent: :destroy
  has_many :hotels, through: :companies
  has_many :hotel_rooms, through: :hotels, source: :rooms
  has_many :booked_rooms, dependent: :destroy
  has_many :rooms, through: :booked_rooms
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.f_name = auth.info.first_name
      user.l_name = auth.info.last_name
      user.skip_confirmation!
    end
  end

  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
