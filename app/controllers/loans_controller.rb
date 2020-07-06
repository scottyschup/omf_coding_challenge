class LoansController < ApplicationController
  def index
    render json: Loan.all_with_balance
  end

  def show
    render json: Loan.find(params[:id]).to_h
  end
end
