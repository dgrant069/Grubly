class Item < ActiveRecord::Base
  belongs_to :restaurant
  has_many :ordered_items
  has_many :orders, through: :ordered_items

  validates :dish_name,   presence: true
  validates :description, presence: true
  validates :dollars,     presence: true,
                          numericality: { greater_than_or_equal_to: 0 }
  validates :cents,       presence: true,
                          numericality: { greater_than_or_equal_to: 0 }
  validates :inventory,   presence: true,
                          numericality: { greater_than_or_equal_to: 0 }
end
