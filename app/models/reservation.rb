class Reservation < ApplicationRecord
  attr_accessor :card_holder_name, :zip, :city, :address

  belongs_to :room

  def price_for_stripe
    (total_price * 100).to_i
  end

  def total_price
    length_of_stay * room.price
  end

  private
  def length_of_stay
    range_of_stay.length
  end

  def range_of_stay
    (reservation_from...reservation_to).to_a
  end


end
