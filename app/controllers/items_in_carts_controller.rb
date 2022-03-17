class ItemsInCartsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :set_items_in_cart, only: %i[ show edit update destroy ]

  # GET /items_in_carts or /items_in_carts.json
  def index
    @items_in_carts = ItemsInCart.all
  end

  # GET /items_in_carts/1 or /items_in_carts/1.json
  def show
    
  end

  # GET /items_in_carts/new
  def new
    @items_in_cart = ItemsInCart.new
  end

  # GET /items_in_carts/1/edit
  def edit
  end

  # POST /items_in_carts or /items_in_carts.json
  def create
    chosen_product = Item.find(params[:item_id])
    current_cart = @current_cart

    @items_in_cart = ItemsInCart.new
    @items_in_cart.cart = current_cart
    @items_in_cart.item = chosen_product

  # Save and redirect to cart show path

    respond_to do |format|
      if @items_in_cart.save
        format.html { redirect_to root_path, notice: "Votre produit a bien été ajouté." }# ajouter flash sur la bonne page 
        format.json { render :show, status: :created, location: @items_in_cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @items_in_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items_in_carts/1 or /items_in_carts/1.json
  def update
    respond_to do |format|
      if @items_in_cart.update(items_in_cart_params)
        format.html { redirect_to @items_in_cart, notice: "Votre ajout a été modifié." }
        format.json { render :show, status: :ok, location: @items_in_cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @items_in_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items_in_carts/1 or /items_in_carts/1.json
  def destroy
    @items_in_cart.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: "votre article a bien été supprimé" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_items_in_cart
      @items_in_cart = ItemsInCart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def items_in_cart_params
      params.fetch(:items_in_cart, {})
    end
end
