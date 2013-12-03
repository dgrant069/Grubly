require "test_helper"

feature "A consumer tries to place orders" do
  scenario "The consumer adds one item to order" do
    # Given a consumer is signed in and visits the restaurant show page
    sign_in_consumer

    # When they correctly submit data
    create_order

    # Then consumer should see a confirmation message
    page.must_have_content "Order was successfully created"

  end

  scenario "The user adds another order" do
    # Given that a consumer has an order with one item already in it
    sign_in_consumer
    create_order

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
