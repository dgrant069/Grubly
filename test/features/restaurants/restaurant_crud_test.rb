require "test_helper"

feature "A restaurant owner or admin wants to CRUD a new restaurant" do
  scenario "a new instance of restaurant gets created when an owner does it" do
    # Given that a signed in user is either an admin or owner
    sign_in_restaurant_owner

    # When that user tries to create a restaurant
    visit restaurants_path
    create_restaurant

    # Then one is added to the database
    visit restaurants_path
    page.text.must_include "Whatever"
    page.text.must_include "Spicy"

  end

  scenario "a new instance of restaurant gets created when an admin does it" do
    # Given that a signed in user is either an admin or owner
    sign_in_admin

    # When that user tries to create a restaurant
    visit restaurants_path
    create_restaurant

    # Then one is added to the database
    visit restaurants_path
    page.text.must_include "Whatever"
    page.text.must_include "Spicy"

  end

  scenario "an existing restaurant gets edited by its owner" do
    # Given an existing restaurant is in the database
    sign_in_restaurant_owner

    # When that restaurant's owner wants to edit its info
    visit restaurants_path
    page.find("tr#restaurant_#{restaurants(:restaurant1).id}").click_on "Edit"
    fill_in "Name", with: "Whatever"
    fill_in "Address", with: "911 Help Me Street, Seattle, WA, 98203"
    fill_in "Category", with: "Spicy"
    fill_in "Phone number", with: "206-555-0000"
    fill_in "Website", with: "www.imdefinitelyonfire.com"
    click_on "Update Restaurant"

    # Then the action is successful
    page.text.must_include "Restaurant was successfully updated."
    page.text.must_include "Whatever"
    page.text.must_include "www.imdefinitelyonfire.com"

  end

  scenario "an existing restaurant gets edited by the site admin" do
    # Given an existing restaurant is in the database
    sign_in_admin

    # When the site admin wants to edit its info
    visit restaurants_path
    page.find("tr#restaurant_#{restaurants(:restaurant1).id}").click_on "Edit"
    fill_in "Name", with: "Whatever"
    fill_in "Address", with: "911 Help Me Street, Seattle, WA, 98203"
    fill_in "Category", with: "Spicy"
    fill_in "Phone number", with: "206-555-0000"
    fill_in "Website", with: "www.imdefinitelyonfire.com"
    click_on "Update Restaurant"

    # Then the action is successful
    page.text.must_include "Restaurant was successfully updated."
    page.text.must_include "Whatever"
    page.text.must_include "www.imdefinitelyonfire.com"

  end

  scenario "an existing restaurant gets deleted by its owner" do
    # Given an existing restaurant is in the database
    sign_in_restaurant_owner

    # When that restaurant's onwer wants to delete that restaurant
    visit restaurants_path
    page.find("tr#restaurant_#{restaurants(:restaurant1).id}").click_on "Destroy"

    # Then the action is successful
    page.wont_have_content "Denny's is Terrible"

  end

  scenario "an existing restaurant gets deleted by the site admin" do
    # Given an existing restaurant is in the database
    sign_in_admin

    # When the site admin wants to delete that restaurant
    visit restaurants_path
    page.find("tr#restaurant_#{restaurants(:restaurant1).id}").click_on "Destroy"

    # Then the action is successful
    page.wont_have_content "Denny's is Terrible"

  end

end
