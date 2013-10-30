require "test_helper"

feature "A user tries to place orders" do
  scenario "The user adds one order" do
    # Given a user is signed in and visits the restaurant show page
    sign_in_restaurant_owner

    # When a restaurant visits a restaurant show page
    visit restaurant_path(restaurants(:restaurant1).id)
    page.text.must_include "Denny's is Terrible"
    click_on "Place Order"


  end

  #scenario "The user adds another order" do

  #end
end
