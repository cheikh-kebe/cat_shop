module OrdersHelper
  def cart_exist?
    @user_cart = Cart.where(user_id: current_user.id)
    @items_in_cart = ItemsInCart.where(cart_id: @user_cart)
    
    if @items_in_cart.count == 0 
      return true
    else
      return false
    end
  end

end
