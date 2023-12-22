class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.all
  end

  def create
    @favourite = Favourite.new
    @favourite.user = current_user
    @favourite.item = Item.find(params[:item_id])
    if @favourite.save
      redirect_to item_path(@favourite.item)
    else
      render 'items/show'
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_to item_path(@favourite.item)
  end
end
