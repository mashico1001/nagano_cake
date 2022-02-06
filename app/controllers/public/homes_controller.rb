class Public::HomesController < ApplicationController
  
  def top
    @genres = Genre.all
    @items = Item.all.order("id DESC").page(params[:page]).per(3)
  end
  
  def about
  end
  
end
