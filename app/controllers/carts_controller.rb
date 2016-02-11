class CartsController < ApplicationController
  def new
    @cart = Cart.new
  end
  
  def index
    @carts = Cart.all
  end
  
  def create
    @cart = Cart.new(cart_params)
    
    @cart.mno = current_watch.id
    if @cart.save
      redirect_to @cart, notice: 'added'
    end    
  end
  
  def add
    @watch = Watch.find(params[:watch])
    #@cart.mno = @watch.mno  
  end
  
  private
  def cart_params
    cart[:params]
  end
end
