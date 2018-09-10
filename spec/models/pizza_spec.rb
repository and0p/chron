require 'rails_helper'

RSpec.describe Pizza, type: :model do

  it "is invalid without a name" do
    p = Pizza.new
    p.price = 10.00
    expect(p).to be_invalid
  end
  it "is invalid without a price" do
    p = Pizza.new
    p.name = "Pepperoni"
    expect(p).to be_invalid
  end
  it "is invalid with a negative price" do
    p = Pizza.new
    p.name = "Pepperoni"
    p.price = -5.50
    expect(p).to be_invalid
  end
  it "is valid with a positive price and name" do
    p = Pizza.new
    p.name = "Pepperoni"
    p.price = 10.20
    expect(p).to be_valid
  end
  it "needs a unique name" do
    p1 = Pizza.new
    p1.name = "Test"
    p1.price = 10.20
    p1.save
    p2 = Pizza.new
    p2.name = "Test"
    p2.price = 10.20
    expect(p2.save).to be_falsey
  end

end