require "test_helper"

feature "A consuemr tries to place orders" do
  scenario "The consumber adds one item to order" do
    # Given a consumer is signed in and visits the restaurant show page
    sign_in_consumer
    visit restaurant_path(restaurants(:restaurant1).id)

    # When they click create order
    click_on "Place Order"
    save_and_open_page

    # Then consumer should see

  end

  #scenario "The user adds another order" do

  #end
end
