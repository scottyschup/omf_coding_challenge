class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.decimal :amount, precision: 8, scale: 2, null: false
      t.datetime :payment_date, null: false
      t.belongs_to :loan, foreign_key: true

      t.timestamps
    end
  end
end
