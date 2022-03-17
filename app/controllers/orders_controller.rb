class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @user_id = current_user.id
    @user_cart = Cart.where(user_id: current_user.id)
    @cart_id = @user_cart.last.id
    @sum= params[:sum]
    
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    @sum = params[:sum]
    @stripe_amount = (@sum.to_f*100).to_i
    @user_id = current_user.id
    begin
      customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })
      charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @stripe_amount,
      description: "Achat d'un produit",
      currency: 'eur',
      })
      
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_order_path
    end
    @customer_stripe_id = customer.id
    
    @user_cart = Cart.where(user_id: current_user.id)
    @current_cart = @user_cart.last
    
    respond_to do |format|
      if @order.save
        @order.update(:customer_stripe_id => @customer_stripe_id )
        @current_cart.destroy
        format.html { redirect_to root_path(current_user.id), notice: "Votre commande a bien été validée, vous allez recevoir un mail tout bientôt !" }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.permit(:user_id, :cart_id, :total_price)
    end

    def user_params
      params.permit(:user_id)
    end

    #def cart_exist
    #  @user_cart = Cart.where(user_id: current_user.id)
    #  @items_in_cart = ItemsInCart.where(cart_id: @user_cart)
    #
    #  if @items_in_cart.count != 0 
    #    puts "if"
    #    return true
    #  else
    #    puts "else"
    #    return false
    #    redirect_to root_path
    #  end
    #end
end
