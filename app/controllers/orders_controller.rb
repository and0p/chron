class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def create
    # Make sure user has passed order items
    if order_params.has_key?(:order_items_attributes) && !order_params[:order_items_attributes].empty?
      @order = Order.create(order_params)
      if @order.persisted?
        @order.calculate_totals
      end
    else
      render status: 400, plain: "No items given. Please press back and fill out the items and counts."
    end
  end

  def new
    @order = Order.new
    1.times do @order.order_items.build end
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