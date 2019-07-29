class ReservationsController < ApplicationController
  Stripe.api_key = ENV['STRIPE_API_TEST_SECRET_KEY']

  def create
    @room = Room.find(params[:room_id])
    @reservation = @room.reservations.build(reservation_params)

    default = default_for(@reservation)
    custome = custom(@reservation)

    payment = payment_service(default.merge(custome))
    if payment.charge.status == 'succeeded' && @reservation.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def custom(reservation)
    if user_signed_in?
      { email: current_user.email, user: current_user }
    else
      { email: reservation.card_owner_email }
    end
  end

  def default_for(reservation)
    {
      token: params[:stripeToken],
      amount: reservation.price_for_stripe,
      description:
                 "Reservation from #{reservation.reservation_from} to #{reservation.reservation_to}"
    }
  end

  def payment_service(opt = {})
    CardPaymentService.new(
      token: opt[:token],
      amount: opt[:amount],
      description: opt[:description],
      email: opt[:email],
      user: opt[:user]
    )
  end

  def reservation_params
    params.require(:reservation).permit(:reservation_from, :reservation_to, :card_owner_email)
  end
end
