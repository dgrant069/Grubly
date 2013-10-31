require "test_helper"

feature "A consumer tries to place orders" do
  scenario "The consumer adds one item to order" do
    # Given a consumer is signed in and visits the restaurant show page
    sign_in_consumer
    visit restaurant_path(restaurants(:restaurant1).id)

    # When they click create order
    click_on "Place Order"
    # And they select a dish from the order form
    select(items(:dish2).dish_name, from: "order_item_to_be_added")
    # And enter quantity
    fill_in "Quantity", with: "2"
    # And then submit the form
    click_on "Create Order"
    # Then consumer should see a confirmation message
    page.must_have_content "Order was successfully created"
  end

  scenario "The user adds another order" do
    pending "passing first scenario"
  end
end
