    require "test_helper"

feature "Restaurants can only delete their menu items" do

  scenario "Restaurant: I can delete any of my menu items" do

    @dish1 = items(:dish1).id
    @dish2 = items(:dish2).id
    @restaurant = restaurants(:restaurant1).id

    # Given I have a existing item
    sign_in_restaurant_owner
    visit restaurant_items_path(restaurants(:restaurant1))

    # When I click the delete link
    #puts "/items/#{@only}"
    click_link('Destroy', href: "/restaurants/#{@restaurant}/items/#{@dish1}")
    click_link('Destroy', href: "/restaurants/#{@restaurant}/items/#{@dish2}")

    # Then item is destroyed and no longer seen
    page.wont_have_content items(:dish1).title
    page.wont_have_content items(:dish2).title
  end
end
