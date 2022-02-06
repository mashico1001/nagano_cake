class Public::ItemsController < ApplicationController
  
  before_action :authenticate_customer!,except: [:index, :show]
  
  def index
    @genres = Genre.all
    @items = params[:name].present? ? Genre.find(params[:name]).items.page : Item.all.page(params[:page]).per(9)
    @items = @items.where('name LIKE ?', "%#{params[:search]}%")if params[:search].present?
  end
  
  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
 
end
