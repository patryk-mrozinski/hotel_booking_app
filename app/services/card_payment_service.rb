require 'stripe'

class CardPaymentService

  def initialize(params = {})
    @token = params[:token]
    @amount = params[:amount]
    @description = params[:description]
    @email = params[:email]
    @user = params[:user]
  end

  def charge
    @charge ||= Stripe::Charge.create(
      amount: @amount,
      currency: 'gbp',
      description: @description,
      customer: customer.id
    )
  end

  private

  def customer
    @customer ||= @user&.stripe_customer_id&.present? ? find_customer : create_customer
  end

  def find_customer
    Stripe::Customer.update(@user.stripe_customer_id, { source: @token })
  end

  def create_customer
    new_customer = Stripe::Customer.create( description: "user email: #{@email}", source: @token )

    @user.update(stripe_customer_id: customer.id) if @user&.stripe_customer_id&.present?

    new_customer
  end
end
