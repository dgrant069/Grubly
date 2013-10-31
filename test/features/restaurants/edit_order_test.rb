require "test_helper"

feature "A consumer tries to place order and then edit it before payment" do
  scenario "The consumer can edit order" do
    # Given a consumer is signed in and visits the restaurant show page
    sign_in_consumer
    visit restaurant_path(restaurants(:restaurant1).id)
    click_on "Place Order"
    select(items(:dish1).dish_name, from: "order_item_to_be_added")
    fill_in "Quantity", with: "2"
    click_on "Create Order"

    # When they click edit order
    click_on "Edit"
    # And they select a dish from the order form
    select(items(:dish2).dish_name, from: "order_item_to_be_added")
    # And enter quantity
    fill_in "Quantity", with: "5"
    # And then submit the form
    click_on "Update Order"
    # Then consumer should see a confirmation message
    page.must_have_content "Order was successfully updated"
  end
end
