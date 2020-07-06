require 'rails_helper'

RSpec.describe Loan, type: :model do
  describe '#outstanding_balance' do
    subject { described_class.new(funded_amount: 100.00) }
    let(:payment_params) { { payment_date: Time.now, amount: 20.00 } }

    it 'returns the funded_amount less payments' do
      subject.payments.build(payment_params)
      expect(subject.outstanding_balance).to eq(80.00)
    end
  end
end
