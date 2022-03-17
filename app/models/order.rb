class Order < ApplicationRecord

  has_many :items_in_cart, dependent: :destroy
  belongs_to :cart, optional: true
  belongs_to :user, optional: true
  
  after_create :order_complete_to_user
  after_create :order_complete_to_admin
  
  def order_complete_to_user
    OrderMailer.order_complete_to_user(self).deliver_now
  end

  def order_complete_to_admin
    OrderMailer.order_complete_to_admin(self).deliver_now
  end

end
