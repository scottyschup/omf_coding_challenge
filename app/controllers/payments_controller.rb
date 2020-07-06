class PaymentsController < ApplicationController
  before_action :set_current_loan

  def index
    render json: @loan.payments
  end

  def show
  end

  def create
  end

  private

  def set_current_loan
    @loan = Loan.find(params[:loan_id])
  end
end
