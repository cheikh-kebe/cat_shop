require "application_system_test_case"

class ItemsInCartsTest < ApplicationSystemTestCase
  setup do
    @items_in_cart = items_in_carts(:one)
  end

  test "visiting the index" do
    visit items_in_carts_url
    assert_selector "h1", text: "Items In Carts"
  end

  test "creating a Items in cart" do
    visit items_in_carts_url
    click_on "New Items In Cart"

    click_on "Create Items in cart"

    assert_text "Items in cart was successfully created"
    click_on "Back"
  end

  test "updating a Items in cart" do
    visit items_in_carts_url
    click_on "Edit", match: :first

    click_on "Update Items in cart"

    assert_text "Items in cart was successfully updated"
    click_on "Back"
  end

  test "destroying a Items in cart" do
    visit items_in_carts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Items in cart was successfully destroyed"
  end
end
