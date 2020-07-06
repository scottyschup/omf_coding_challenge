class PaymentsController < ApplicationController
  before_action :set_current_loan

  def index
    render json: @loan.payments
  end

  def show
    render json: Payment.find(params[:id])
  end

  def create
    @payment = @loan.payments.build(format_datetime(payment_params))

    if @payment.save
      render json: @payment, status: :created
    else
      render json: @payment.errors, status: :bad_request
    end
  end

  private

  def payment_params
    params
      .require(:payment)
      .permit(:amount, :payment_date)
  end

  def set_current_loan
    @loan = Loan.find(params[:loan_id])
  end

  # This could also be done in the model, right before the create method is called,
  # which would make testing a little less complicated. But since the only place
  # it's needed right now is on `PaymentsController#create` actions, I put the
  # helper method here.
  def format_datetime(attrs)
    attrs[:payment_date] = Time.at(attrs[:payment_date].to_i)
    attrs
  end
end
