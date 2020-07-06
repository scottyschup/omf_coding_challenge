require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  let(:loan) { Loan.create!(funded_amount: 100.0) }
  let(:payment_data) { { amount: 50.00, payment_date: Time.now } }
  let(:payment) { Payment.create!(**payment_data, loan_id: loan.id) }

  describe '#index' do
    it 'responds with a 200' do
      get :index, params: { loan_id: loan.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    it 'responds with a 200' do
      get :show, params: { loan_id: loan.id, id: payment.id }
      expect(response).to have_http_status(:ok)
    end

    context 'if the payment is not found' do
      it 'responds with a 404' do
        get :show, params: { loan_id: loan.id, id: 10000 }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end

