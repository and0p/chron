class OrdersController < ApplicationController

  def index
    @orders = Order.all
    render json: @orders
  end

  def create
    # Make sure user has passed order items
    if order_params[:order_items_attributes].any?
      @order = Order.create(order_params)#.except(:order_items_attributes))
      @order.calculate_totals
      if @order.persisted?
        render status: 200, json: @order
      else
        render status: 500, text: "Internal error."
      end
    else
      render status: 400, text: "No items given."
    end
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