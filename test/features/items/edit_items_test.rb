require "test_helper"

feature "ItemEdit" do

  scenario "Restaurant: When signed in, I can submit form data to edit an item" do

    # Given that I'm the signed in owner of a restaurant and have complete form data
    sign_in_restaurant_owner
    visit edit_restaurant_item_path(restaurants(:restaurant1), items(:dish1))
    fill_in 'Description', with: "You gave him $3.50? No wonder he keeps coming back"

    # When I submit the form
    click_on 'Update Item'

    # Then a new item is created and can be seen
    page.wont_have_content "monster"
    page.must_have_content "No wonder he keeps coming back"
  end
end
