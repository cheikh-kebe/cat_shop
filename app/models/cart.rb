class Cart < ApplicationRecord
  
  has_many :items, through: :items_in_carts
  belongs_to :user, optional: true
  has_many :items_in_cart, dependent: :destroy

end
