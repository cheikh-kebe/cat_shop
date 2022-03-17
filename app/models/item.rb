class Item < ApplicationRecord
 
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }

  validates :title, presence: true,length: {minimum: 3, maximum: 140}  #limites caractères (min/max)
  
  validates :description, presence: true, length: {minimum: 20, maximum: 1000}  #limites caractères (min/max)
  
  has_many :carts
  has_many :items_in_cart, dependent: :destroy

  has_one_attached :image

end
