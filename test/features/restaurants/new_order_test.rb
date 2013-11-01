require "test_helper"

feature "A consumer tries to place orders" do
  scenario "The consumer adds one item to order" do
    # Given a consumer is signed in and visits the restaurant show page
    sign_in_consumer
    visit new_restaurant_order_path(restaurants(:restaurant1).id)

    # When they click create order
    click_on "Create Order"
    click_on "Show"
    click_on "Add to Order"

    # And they select a dish from the order form
    select(items(:dish1).dish_name)

    # And enter quantity
    fill_in "Quantity", with: "2"

    # And then submit the form
    click_on "Create Ordered item"

    # Then consumer should see a confirmation message
    page.must_have_content "Order item was successfully added"

  end

  scenario "The user adds another order" do
    # Given that a consumer has an order with one item already in it
    sign_in_consumer
    visit new_restaurant_order_path(restaurants(:restaurant1).id)
    click_on "Create Order"
    click_on "Show"
    click_on "Add to Order"
    select(items(:dish1).dish_name)
    fill_in "Quantity", with: "2"
    click_on "Create Ordered item"

    # When they try to add another item to the order
    click_on "Add to Order"
    select(items(:dish2).dish_name)
    fill_in "Quantity", with: "4"
    click_on "Create Ordered item"

    # The consumer will have more than one item in their order
    page.text.must_include "Girl scout cookies"
    page.text.must_include "Anchovie pizza"

  end
end
