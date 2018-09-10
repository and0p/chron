require 'rails_helper'

RSpec.describe Order, type: :model do

  it "is invalid without a customer name" do
    order = Order.new(customer_address: "123 Example Rd")
    expect(order).to be_invalid
    order.customer_name = "John Smith"
    expect(order).to be_valid
  end

  it "is invalid without a customer address" do
    order = Order.new(customer_name: "John Smith")
    expect(order).to be_invalid
    order.customer_address = "123 Example Rd"
    expect(order).to be_valid
  end

end
