require "test_helper"

feature "an order gets finalized" do
  scenario "a user can finalize their order and then not be able to change it" do
    # Given that a user has an account
    sign_in_consumer

    # When they create an order and hit "finalize"
    create_order
    click_on "Finalize Order"
    click_on "Show"

    # It won't let them edit or delete any items from it
    page.must_have_content "Your order has already been finalized!"
    page.wont_have_content "Add to Order"
    page.wont_have_content "Edit Item"
    page.wont_have_content "Remove Item"
  end

  scenario "an owner can finalize an order and still change it" do
    # Given a restaurant owner is signed in
    sign_in_restaurant_owner

    # When he places an order at his own restaurant and hits "finalize"
    create_order
    click_on "Finalize Order"
    click_on "Show"

    # It will let them edit or delete any items from it
    page.must_have_content "Your order has already been finalized!"
    page.must_have_content "Edit Item"
    page.must_have_content "Remove Item"
  end

  scenario "a different restaurant owner cannot change an order at the first restaurant" do
    # Given a restaurant owner is signed in and DOESN'T own the restaurant they want to place an order at
    sign_in_restaurant_owner2

    # When he places an order at that restaurant and hits "finalize"
    create_order
    click_on "Finalize Order"
    click_on "Show"

    # It will not let them edit or delete any items from it (like a normal user)
    page.must_have_content "Your order has already been finalized!"
    page.wont_have_content "Add to Order"
    page.wont_have_content "Edit Item"
    page.wont_have_content "Remove Item"
  end

  scenario "an admin can finalize an order and still change it" do
    # Given that an admin makes an order
    sign_in_admin
    create_order

    # When he finalizes it
    click_on "Finalize Order"
    click_on "Show"

    # He can still change it
    page.must_have_content "Your order has already been finalized!"
    page.must_have_content "Edit Item"
    page.must_have_content "Remove Item"
  end
end

feature "an order gets marked as filled" do
  scenario "an owner can mark an order as filled" do
    # Given that there are orders for a restaurant and the owner is signed in
    sign_in_restaurant_owner
    create_order

    # When the owner marks an order as completed
    click_on "Finalize Order"
    click_on "Order Completed!"

    # Then the page reflects that change
    page.must_have_content "Order Filled!"
  end

  scenario "a restaurant owner from a different restaurant cannot mark an order as filled" do
    # Given that a restaurant owner makes an order at a restaurant he doesn't own
    sign_in_restaurant_owner2
    create_order

    # When he finalizes an order
    click_on "Finalize Order"

    # Then he still won't have permission to mark it as completed
    page.wont_have_content "Order Completed!"
  end

  scenario "an admin can mark an order as filled" do
    # Given that there are orders for a restaurant and the admin is signed in
    sign_in_admin
    create_order

    # When the owner marks an order as completed
    click_on "Finalize Order"
    click_on "Order Completed!"

    # Then the page reflects that change
    page.must_have_content "Order Filled!"
  end

  scenario "a user cannot mark an order as filled" do
    # Given that a user creates an order
    sign_in_consumer
    create_order

    # When the user finalizes the order
    click_on "Finalize Order"

    # Then the page won't let them mark something as completed
    page.wont_have_content "Order Completed!"
  end
end
