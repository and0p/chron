class Order < ApplicationRecord

  has_many :pizzas, through: :order_items
  has_many :order_items, dependent: :destroy

  validates_presence_of :customer_name, :customer_address, :price, :tax, :total

end
