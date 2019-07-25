class ReservationsController < ApplicationController

  Stripe.api_key = ENV['STRIPE_API_TEST_SECRET_KEY']

  def create
    @room = Room.find(params[:room_id])
    @reservation = @room.reservations.build(reservation_params)
    default = {
      token: params[:stripeToken],
      amount: @reservation.price_for_stripe,
      description: "Reservation from #{ @reservation.reservation_from } to #{ @reservation.reservation_to }"
    }

    if user_signed_in?
      custome = { email: current_user.email, user: current_user }
    else
      custome = { email: @reservation.card_owner_email }
    end

    payment = payment_service(default.merge(custome))
    charge = payment.charge

    if charge.status == 'succeeded' && @reservation.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def payment_service(opt = {})
    CardPaymentService.new({
      token: opt[:token],
      amount: opt[:amount],
      description: opt[:description],
      email: opt[:email],
      user: opt[:user]
    })
  end

  def reservation_params
    params.require(:reservation).permit(:reservation_from, :reservation_to, :card_owner_email)
  end
end
