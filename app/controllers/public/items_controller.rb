class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = params[:name].present? ? Genre.find(params[:name]).items : Item.all
    @items = @items.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end
  
  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
 
end
