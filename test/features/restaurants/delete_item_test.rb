require "test_helper"

feature "A consumer tries to place order and then delete it before payment" do
  scenario "The consumer can delete order" do
    # Given a consumer is signed in and visits the restaurant show page
    sign_in_consumer
    visit restaurant_path(restaurants(:restaurant1).id)
    click_on "Place Order"
    select(items(:dish1).dish_name, from: "order_item_to_be_added")
    fill_in "Quantity", with: "2"
    click_on "Create Order"

    # When they click edit order
    click_on "Destroy"
    # Then consumer should see a confirmation message
    page.must_have_content "Order was successfully destroyed"
  end
end
