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
        render status: 200, json: @order
      else
        render status: 500, text: "Internal error."
      end
    else
      render status: 400, text: "No items given."
    end
  end

  def new
    @order = Order.new
    2.times do @order.order_items.build end
    @pizzas = Pizza.all
  end

  def show
    @order = Order.find(params[:id])
    render json: @order
  end

  private

  # Define usable params
  def order_params
    params[:order].permit(:customer_name, :customer_address, order_items_attributes: [ :pizza_id, :count ])
  end

end