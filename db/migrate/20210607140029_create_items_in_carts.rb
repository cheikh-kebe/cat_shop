class CreateItemsInCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :items_in_carts do |t|
      t.belongs_to :cart
      t.belongs_to :item 
      t.belongs_to :order
      t.integer :quantity
      t.timestamps
    end
  end
end
