class OrdersController < ApplicationController
  def index
    @orders = Order.all
    render json: @orders
  end

  def create
    redirect_to Order.create(order_params)
  end
end