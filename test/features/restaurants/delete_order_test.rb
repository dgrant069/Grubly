require "test_helper"

feature "A consumer tries to place order and then delete it before payment" do
  scenario "The consumer can delete order" do
    # Given a consumer is signed in and visits the restaurant show page
    create_order
    visit restaurant_orders_path(restaurants(:restaurant1).id)

    # When they click edit order
    click_on "Destroy"
    # Then consumer should see a confirmation message
    page.must_have_content "It looks like you don't have any orders for this restaurant yet! Would you like to build one?"
  end
end
