class Order < ApplicationRecord

  has_many :pizzas, through: :order_items
  has_many :order_items, dependent: :destroy

  validates_presence_of :customer_name, :customer_address # leaving these out for now :price, :tax, :total, :discount
  accepts_nested_attributes_for :order_items, allow_destroy: true

  validate do
    #order_items.count > 0 # TODO I've seen this pattern elsewhere, getting unexpected results
  end

  def calculate_totals
    price = 0
    # Calculate cost of all pizzas purchased
    order_items.each do |item|
      price += Pizza.find(item.pizza_id).price * item.count
    end
    if price > 50
      discount = 5
      price -= discount
    else
      discount = 0
    end
    tax = price * 0.08
    total = price + tax
    update(price: price, tax: tax, total: total, discount: discount )
  end

end
