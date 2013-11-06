require 'simplecov'
SimpleCov.start

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/focus"
require "minitest/pride"

class ActiveSupport::TestCase
  fixtures :all
end

class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Capybara::DSL
end

def create_order
  visit new_restaurant_order_path(restaurants(:restaurant1).id)
  click_on "Create Order"
  click_on "Show"
  click_on "Add to Order"
  select(items(:dish1).dish_name)
  fill_in "Quantity", with: "2"
  click_on "Create Ordered item"
end

def sign_in_restaurant_owner(role = "owner")
  visit new_user_session_path
  fill_in "Email", with: users(:restaurant_owner1).email
  fill_in "Password", with: "password"
  click_on "Sign in"
end

def sign_in_restaurant_owner2(role = "owner")
  visit new_user_session_path
  fill_in "Email", with: users(:restaurant_owner2).email
  fill_in "Password", with: "password"
  click_on "Sign in"
end

def sign_in_admin(role = "admin")
  visit new_user_session_path
  fill_in "Email", with: users(:admin).email
  fill_in "Password", with: "password"
  click_on "Sign in"
end

def sign_in_consumer
  visit new_user_session_path
  fill_in "Email", with: users(:normal_user1).email
  fill_in "Password", with: "password"
  click_on "Sign in"
end

def create_restaurant
  visit new_restaurant_path
  fill_in "Name", with: "Whatever"
  fill_in "Address", with: "911 Help Me Street, Seattle, WA, 98203"
  fill_in "Category", with: "Spicy"
  fill_in "Phone number", with: "206-555-0000"
  fill_in "Website", with: "www.imdefinitelyonfire.com"
  click_on "Create Restaurant"
end

def sign_in_twitter_user
  OmniAuth.config.test_mode = true
  Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
  Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
  OmniAuth.config.add_mock(:twitter, { uid: '12345', info: { nickname: 'test_twitter_user'},})
end

Turn.config.format = :outline
