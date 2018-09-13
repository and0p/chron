class Order < ApplicationRecord

  has_many :pizzas, through: :order_items
  has_many :order_items, inverse_of: :order, dependent: :destroy

  before_validation :calculate_totals

  validates_presence_of :customer_name, :customer_address, :price, :tax, :total, :discount
  accepts_nested_attributes_for :order_items, allow_destroy: true

  validate do
    check_order_items_number
  end

  def calculate_totals
    begin
      price = 0
      discount = 0
      # Calculate cost of all pizzas purchased
      order_items.each do |item|
        price += Pizza.find(item.pizza_id).price * item.count
      end
      if price > 50
        discount = 5
        price -= discount
      end
      self.price = price
      self.discount = discount
      self.tax = price * 0.08
      self.total = price + tax
    rescue ActiveRecord::RecordNotFound => e
      errors.add(:base, "Invalid Pizza specified.")
    end
  end

  private

  def order_items_count_valid?
    order_items.reject(&:marked_for_destruction?).count > 0
  end

  def check_order_items_number
    unless order_items_count_valid?
      errors.add(:base, :order_items_too_short, :count > 0)
    end
  end

end
