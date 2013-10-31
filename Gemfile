source 'https://rubygems.org'

gem 'simplecov', :require => false, :group => :test
gem 'pundit'
gem 'omniauth-twitter'
gem 'figaro'
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass'
gem 'devise'
gem 'turbolinks'

group :development, :test do
  gem "minitest-rails"
  gem 'pry-rails'
  gem "faker"
  gem "sqlite3"
  gem "launchy"
  gem "turn"
end

group :test do
  gem "minitest-rails-capybara"
  gem "minitest-focus"
end

gem 'rails', '4.0.0'

group :production do
  gem 'rails_12factor'
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails', '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platforms => :ruby

gem 'uglifier', '>= 1.3.0'


gem 'jquery-rails', "2.3.0"

ruby '2.0.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
gem 'jbuilder', '~> 1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
