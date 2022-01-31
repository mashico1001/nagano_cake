class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def confirm
    @total = 0
    @order = Order.new(order_params)
    @order.postage = 800
    if params[:order][:select_address] == "0"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
        @address = Address.find(params[:order][:address_id])
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name
    else
    end
    @cart_items = CartItem.all
  end
  
  def thanks
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    
    @cart_items = current_customer.cart_items
    
    @cart_items.each do |cart_item|
    OrderDetail.create(
      order_id: @order.id,
      item_id: cart_item.item.id,
      purchase_price: cart_item.item.with_tax_price,
      quantity: cart_item.amount,
      )
    end
    
    current_customer.cart_items.destroy_all
    redirect_to orders_thanks_path
    
  end
  
  def index
    @orders = current_customer.orders
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = 0
    
    @order_details.each do |order_detail|
      @total += order_detail.purchase_price * order_detail.quantity
    end
    
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_status, :postal_code, :address, :name, :postage, :total_price)
  end
 
end
