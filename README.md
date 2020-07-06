# Payments Exercise

Add in the ability to create payments for a given loan using a JSON API call. You should store the payment date and amount. Expose the outstanding balance for a given loan in the JSON vended for `LoansController#show` and `LoansController#index`. The outstanding balance should be calculated as the `funded_amount` minus all of the payment amounts.

A payment should not be able to be created that exceeds the outstanding balance of a loan. You should return validation errors if a payment can not be created. Expose endpoints for seeing all payments for a given loan as well as seeing an individual payment.

## Solution
### Success criteria:
* payment can be made via API call
  * Payment date and amount should be saved
* include outstanding balance in `loans#show` and `loans#index`
  * `outstanding_balance = funded_amount - payments.inject(0) { |agg, payment| agg + payment.amount }`
* payment may not be larger than outstanding balance
  * invalid payments should return validation errors
* payment history and individual payment info should be accessible via API calls as well

### Task breakdown
* create `Payments` tests
  * create payment
    * with date/amount: 201
    * payment invalid: 400 missing date or amount
    * payment invalid: 400 larger than outstanding
  * `payments#index` 200
  * `payments#show` 200
* update `Loans` tests to include outstanding balance in response for `show`/`index`
* create `Payment` model/table
  * add validations
  * add associations to `Loan` model (P belongs_to, L has_many)
* create `PaymentsController` and actions
  * `create`
  * `index`
  * `show`
* create routes for payments:
  * `create`
  * `index`
  * `show`
* add `outstanding_balance` method to `Loan`
* add payment amount validation helper
