class Loan < ActiveRecord::Base
  has_many :payments, dependent: :destroy

  def outstanding_balance
    return funded_amount if payments.empty?
    funded_amount - payments.inject(0) { |agg, payment| agg + (payment&.amount || 0) }
  end
end
