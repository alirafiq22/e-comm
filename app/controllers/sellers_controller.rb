class SellersController < ApplicationController
  before_action :set_seller, only: [ :edit, :update]

  # GET /sellers
  def index
    @sellers = Seller.all
  end

  # GET /sellers/1
  def show
  end

  # GET /sellers/new
  def new
    @seller = Seller.new
  end

  # GET /sellers/1/edit
  def edit
  end

  # POST /sellers
  def create
    @seller = Seller.new(seller_params)

    if @seller.save
      redirect_to @seller, notice: 'Seller was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sellers/1
  def update
    if @seller.update(seller_params)
      redirect_to @seller, notice: 'Seller was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sellers/1
  def destroy
    # @seller.destroy
    #redirect_to sellers_url, notice: 'Seller was successfully destroyed.'
    redirect_to root
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller
      @seller = Seller.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def seller_params
      params[:seller]
    end
end
