class ReservationConfirmationMailer < ApplicationMailer
  default from: 'notifications@example.com'

  layout 'mailer'

  def confirmation_email
    @reservation = params[:reservation]
    @url = 'http://example.com/login'
    mail(to: @reservation.card_owner_email, subject: 'Reservation Confirmation')
  end
end
