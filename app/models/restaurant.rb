class Restaurant < ActiveRecord::Base
<<<<<<< HEAD
=======
  has_many :users
>>>>>>> f5d57e93cfaee9f09d46ebffc4f8c6bade9cffc7
  has_many :orders
  has_many :items, :dependent => :destroy
  has_many :users
end
