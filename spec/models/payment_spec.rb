require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:loan) { Loan.new(funded_amount: 100.00) }
  subject { described_class.new(loan_id: loan.id) }

  before do
    loan.payments << subject
  end

  it 'is valid with amount and date' do
    subject.payment_date = Time.now
    subject.amount = 20.00
    expect(subject).to be_valid
  end

  it 'validates presence of payment_date' do
    subject.amount = 20.00
    expect(subject).to_not be_valid
  end

  it 'validates presence of amount' do
    subject.payment_date = Time.now
    allow(subject).to receive(:amount_not_greater_than_outstanding_balance)
    expect(subject).to_not be_valid
  end

  it 'validates that amount is not greater than outstsanding balance' do
    subject.payment_date = Time.now
    subject.amount = 200.00
    expect(subject).to_not be_valid
  end
end
