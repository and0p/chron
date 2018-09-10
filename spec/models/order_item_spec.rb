require 'rails_helper'

RSpec.describe OrderItem, type: :model do

  it "is only valid with a count greater than 0" do
    pizza  = Pizza.create(name: "TestOrderItem123", price: 5000)
    order  = Order.create(customer_name: "Test", customer_address: "test", price: 50, tax: 50, discount: 50, total: 50)
    oi = OrderItem.new
    # oi.pizza = @pizza
    # oi.order = @order
    oi.pizza_id = pizza.id
    oi.order_id = order.id
    oi.count = -1
    expect(oi).to be_invalid
    oi.count = 0
    expect(oi).to be_invalid
    oi.count = 5
    expect(oi).to be_valid
  end

  it "is only valid with an order and pizza associated" do
    pizza  = Pizza.create(name: "TestOrderItem123", price: 5000)
    order  = Order.create(customer_name: "Test", customer_address: "test", price: 50, tax: 50, discount: 50, total: 50)
    oi = OrderItem.new
    oi.count = 1
    expect(oi).to be_invalid
    oi.pizza_id = pizza.id
    oi.order_id = order.id
    expect(oi).to be_valid
  end

end