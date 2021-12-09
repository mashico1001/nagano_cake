class Admin::CustomersController < ApplicationController
  
  def index
    @customers = Customer.all
  end

  def show
    @customer = find(params[:id])
  end
  
  def edit
    @customer = find(params[:id])
  end
  
  def update
  end

end
