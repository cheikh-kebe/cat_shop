class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show edit update destroy ]
  before_action :cart_authorized?
  # GET /carts or /carts.json
  def index
    @carts = Cart.all
    @user_cart = Cart.where(user_id: user_params)
    @user_id = current_user.id
    @items_in_cart = ItemsInCart.where(cart_id: @user_cart)
    @cart_id = @user_cart.last.id
    @sum = @sum
  
  end

  # GET /carts/1 or /carts/1.json
  def show
    
  end

  # GET /carts/new
  def new
    @cart = Cart.new
    @user = User.find(params[id: user_id])
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  # def create
  #   @cart = Cart.new(cart_params)

  #   respond_to do |format|
  #     if @cart.save
  #       format.html { redirect_to @cart, notice: "Cart was successfully created." }
  #       format.json { render :show, status: :created, location: @cart }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @cart.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.fetch(:cart, {})
    end

    def user_params
      params.require(:user_id)
    end

    def cart_authorized?
      @user_cart = Cart.where(user_id: user_params)
      @cart_id = @user_cart.last.id
      if @cart_id == @current_cart.id
        return true
        # if @cart_id == nil
        #   return false
        # else
        #   flash[:alert] = "veuillez vous connecter!"
        #   redirect_to new_user_registration_path
        # end
      else
        flash[:alert] = "Ce n'est pas votre panier!"
        redirect_to root_path
        return false
      end 
    end
end
