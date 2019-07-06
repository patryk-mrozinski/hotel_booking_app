class Hotel < ApplicationRecord
  has_many :rooms, dependent: :destroy
  belongs_to :company
  belongs_to :city

  validates :name, :stars, :description, presence: true

  def self.filter(params = {})
    if params.empty?
      all
    else
      where(stars: params[:stars])
    end
  end
end
