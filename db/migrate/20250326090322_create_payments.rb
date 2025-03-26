class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true
      t.integer :amount
      t.string :payment_method
      t.string :status

      t.timestamps
    end
  end
end
