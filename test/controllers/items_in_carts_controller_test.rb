require 'test_helper'

class ItemsInCartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @items_in_cart = items_in_carts(:one)
  end

  test "should get index" do
    get items_in_carts_url
    assert_response :success
  end

  test "should get new" do
    get new_items_in_cart_url
    assert_response :success
  end

  test "should create items_in_cart" do
    assert_difference('ItemsInCart.count') do
      post items_in_carts_url, params: { items_in_cart: {  } }
    end

    assert_redirected_to items_in_cart_url(ItemsInCart.last)
  end

  test "should show items_in_cart" do
    get items_in_cart_url(@items_in_cart)
    assert_response :success
  end

  test "should get edit" do
    get edit_items_in_cart_url(@items_in_cart)
    assert_response :success
  end

  test "should update items_in_cart" do
    patch items_in_cart_url(@items_in_cart), params: { items_in_cart: {  } }
    assert_redirected_to items_in_cart_url(@items_in_cart)
  end

  test "should destroy items_in_cart" do
    assert_difference('ItemsInCart.count', -1) do
      delete items_in_cart_url(@items_in_cart)
    end

    assert_redirected_to items_in_carts_url
  end
end
