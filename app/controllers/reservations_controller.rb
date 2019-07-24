class ReservationsController < ApplicationController
  require 'stripe'
  Stripe.api_key = ENV['STRIPE_API_TEST_SECRET_KEY']

  def create
    @room = Room.find(params[:room_id])
    @reservation = @room.reservations.build(reservation_params)

    token = params[:stripeToken]
    amount = @reservation.price_for_stripe

    if user_signed_in?

      if current_user.stripe_customer_id.present?

        customer = Stripe::Customer.update(current_user.stripe_customer_id, { source: token })

        charge = Stripe::Charge.create(
          amount: amount,
          currency: 'gbp',
          description: "Reservation from #{ @reservation.reservation_from } to #{ @reservation.reservation_to }",
          customer: customer.id
        )

      else

        customer = Stripe::Customer.create(
          description: "token: #{token}, user email: #{current_user.email}",
          source: token
        )

        current_user.update(stripe_customer_id: customer.id)

        charge = Stripe::Charge.create(
          amount: amount,
          currency: 'gbp',
          description: "Reservation from #{ @reservation.reservation_from } to #{ @reservation.reservation_to }",
          customer: customer.id,
        )
      end

      else

        charge = Stripe::Charge.create(
          amount: amount,
          currency: 'gbp',
          description: "Reservation from #{ @reservation.reservation_from } to #{ @reservation.reservation_to }",
          source: token,
        )
    end

    if charge.status == 'succeeded' && @reservation.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_from, :reservation_to)
  end
end
