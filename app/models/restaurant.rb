class Restaurant < ActiveRecord::Base
  has_many :users
  has_many :orders
  has_many :items, :dependent => :destroy
end
