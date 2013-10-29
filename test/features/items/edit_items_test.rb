require "test_helper"

feature "ItemEdit" do

  scenario "Restaurant: When signed in, I can submit form data to edit an item" do

    # Given that I'm signed in and have complete form data
    login_owner
    visit restaurant_items_path(items(:dish1))
    click_on 'Edit'
    fill_in 'Description', with: "You gave him $3.50? No wonder he keeps coming back"

    # When I submit the form
    click_on 'Update Item'

    # Then a new item is created and can be seen
    page.must_have_content "Item was successfully updated."
    page.wont_have_content "monster"
    page.must_have_content "No wonder he keeps coming back"
  end
end
