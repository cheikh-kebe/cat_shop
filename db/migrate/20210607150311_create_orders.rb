class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :customer_stripe_id
      t.decimal :total_price
      t.belongs_to :user
      t.belongs_to :cart

      t.timestamps
    end
  end
end
