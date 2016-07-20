class WatchesController < ApplicationController
  before_action :set_watch, only: [:show, :edit, :update, :destroy]

  # GET /watches
  def index
    @watches = Watch.all
  end

  # GET /watches/1
  def show
    @watch = Watch.find(params[:id])
  end

  # GET /watches/new
  def new
    @watch = Watch.new
  end

  # GET /watches/1/edit
  def edit
  end

  # POST /watches
  def create
    if seller_signed_in?
      @watch = Watch.new(watch_params)
      @watch.owner = current_seller.id
      @watch.save
      if @watch.save
        redirect_to @watch, notice: 'Watch was successfully created.'
      else
        render :new
      end
    else
      redirect_to seller_session_path, notice: 'You need to be signed in to create a watch'  
    end
  end

  # PATCH/PUT /watches/1
  def update
    @watch = Watch.find(params[:id])
    if seller_signed_in?
      if current_seller.id == @watch.owner
        if @watch.update(watch_params)
          redirect_to @watch, notice: 'Watch was successfully updated.'
        else
          render :edit
        end
      else
        redirect_to watches_path, notice: 'UNAUTHORIZED USER!! You cant edit this watch'
      end
    else
      redirect_to seller_session_path, notice: 'UNAUTHORIZED!! sign in plz'
    end
  end

  # DELETE /watches/1
  def destroy
    @watch = Watch.find(params[:id])
    if seller_signed_in?
      if current_seller.id == @watch.owner
        @watch.destroy
        redirect_to watches_url, notice: 'Watch was successfully destroyed.'
      else
        redirect_to watches_path, notice: 'UNAUTHORIZED USER!! You cant delete this Watch'
      end
    else
      redirect_to seller_session_path, notice: 'UNAUTHORIZED! Sign In first'
    end
  end

  def buy
    
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watch
      @watch = Watch.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def watch_params
      #params.require(:watch).permit!
      params.require(:watch).permit(:company, :mno, :qty, :imgurl)
    end
end
