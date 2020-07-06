class Payment < ActiveRecord::Base
  belongs_to :loan

  validates :amount, presence: true
  validates :payment_date, presence: true
  validate :amount_not_greater_than_outstanding_balance

  def create(params)
    params[:payment_date] = Time.at(params[:payment_date])
    super
  end

  private

  def amount_not_greater_than_outstanding_balance
    return errors.add(:loan, "must be associated") if !loan
    return true if amount <= loan.outstanding_balance
    errors.add(:amount, "can't be larger than outstanding loan balance")
  end
end
