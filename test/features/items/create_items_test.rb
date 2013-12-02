require "test_helper"

feature "Menu Item Creation" do

  scenario "Restaurant: When signed in, I can submit form data to create a menu item" do

    # Given that I'm signed in and have complete form data
    sign_in_restaurant_owner
    save_and_open_page
    visit restaurant_items_path(restaurants(:restaurant1))
    save_and_open_page
    click_on 'New Item'
    fill_in 'Dish name', with: items(:dish3).dish_name
    fill_in 'Description', with: items(:dish3).description

    # When I submit the form
    click_on 'Create Item'

    # Then a new item is created and can be seen
    page.must_have_content items(:dish3).dish_name

  end
end
