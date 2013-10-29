require "test_helper"

feature "Unauthorized users can't CRUD menu actions" do

  scenario "Visitor: I can't see CRUD links" do

    # Given that I'm a vistor

    # When I visit a restaurants page
    visit restaurant_items_path

    # Then I won't see Destroy link
    page.wont_have_content "New Item"
    page.wont_have_content "Edit"
    page.wont_have_content "Destroy"
  end

  scenario "Consumer: I can't see CRUD actions" do

    # Given that I'm an Consumer
    login_consumer

    # When I visit a restaurants page
    visit restaurant_items_path

    # Then I can't see and CRUD actions
    page.wont_have_content "New Item"
    page.wont_have_content "Edit"
    page.wont_have_content "Destroy"
  end

  scenario "Visitor: I can't hack around to the CRUD" do

    # Given that I'm a vistor

    # When I try to visit CRUD actions
    visit edit_restaurant_item(items(:dish1))

    # Then I see either a doesn't exist page or an unauthorized
    page.must_have_content "Couldn't find Restaurant"
  end

  scenario "Consumer: I can't hack around to the CRUD" do

    # Given I'm signed in as a consumer
    login_consumer

    # When I try to visit CRUD actions
    visit edit_restaurant_item(items(:dish1))

    # Then I see either a doesn't exist page or an unauthorized
    page.wont_have_content "Item was successfully updated."
    page.must_have_content "Couldn't find Restaurant"
  end

    scenario "Restaurants: I can't see other Restaurants CRUD actions" do

    # Given that I'm Restaurant 1
    login_owner

    # When I visit Restaurant 2's page
    visit restaurant_items_path

    # Then I won't see CRUD actions
    page.wont_have_content "New Item"
    page.wont_have_content "Edit"
    page.wont_have_content "Destroy"
  end

    scenario "Restaurants: I can't hack around to the CRUD of another Restaurant" do

    # Given I'm signed in as a Restaurant
    login_owner

    # When I click edit and submit form data
    visit restaurant_items_path(items(:dish3))

    # Then the item is updated and changes viewable
    page.wont_have_content "Item was successfully updated."
    page.must_have_content "Couldn't find Restaurant"
  end
end
