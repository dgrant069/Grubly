class Restaurant < ActiveRecord::Base
  has_many :users
  has_many :orders
  has_many :customers, class_name: "User", through: :orders
  has_many :items, dependent: :destroy
  has_many :photos, as: :photoable
end
