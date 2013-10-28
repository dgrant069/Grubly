class Restaurant < ActiveRecord::Base
  #has_many :users, :through => :orders
  has_many :items
end
