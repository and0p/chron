class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :pizza

  validates_presence_of :pizza_id, :order_id
  validates :count, presence: true, numericality: { greater_than: 0 }

end