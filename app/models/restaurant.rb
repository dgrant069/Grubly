class Restaurant < ActiveRecord::Base
  has_many :orders
  has_many :items, :dependent => :destroy
  belongs_to :user
end
