class OrderMailer < ApplicationMailer


  default from: 'bousquet.valentin@gmail.com'
 

  def order_complete_to_user(order)
    
    @url         = 'https://cute-cat-shop-thp.herokuapp.com/'
    @user        = order.user
    @total_price = order.total_price
    @items_buy   = ItemsInCart.where(cart_id: order.cart_id)

    mail(to: @user.email, subject: 'Commande passée avec succès !') 

  end


  def order_complete_to_admin(order)

    @url         = 'https://cute-cat-shop-thp.herokuapp.com/'
    @user        = order.user
    @total_price = order.total_price
    @items_buy   = ItemsInCart.where(cart_id: order.cart_id)
    mail(to: "bousquet.valentin@gmail.com", subject: "#{@user.email} a passé une commande !")

  end


end