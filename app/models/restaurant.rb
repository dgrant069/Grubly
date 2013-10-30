class Restaurant < ActiveRecord::Base
  has_many :orders
  has_many :items, :dependent => :destroy
  has_many :users
end
