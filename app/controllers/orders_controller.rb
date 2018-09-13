class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def create
    @order = Order.create(order_params)
  end

  def new
    @order = Order.new
    @order.order_items.build
    @pizzas = Pizza.all
  end

  def show
    @order = Order.find(params[:id])
    render json: @order
  end

  private

  # Define usable params
  def order_params
    params[:order].permit(:customer_name, :customer_address, order_items_attributes: [ :id, :pizza_id, :count, :_destroy ])
  end

end