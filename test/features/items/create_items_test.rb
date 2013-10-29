require "test_helper"

feature "Menu Item Creation" do

  scenario "Restaurant: When signed in, I can submit form data to create a menu item" do

    # Given that I'm signed in and have complete form data
    login_owner
    visit restaurant_items_path
    click_on 'New Item'
    fill_in 'Dish Name', with: items(:dish1).dish_name
    fill_in 'Description', with: items(:dish1).description

    # When I submit the form
    click_on 'Create Item'

    # Then a new item is created and can be seen
    page.must_have_content "Item was successfully created."
    page.must_have_content items(:dish1).dish_name
  end
end
