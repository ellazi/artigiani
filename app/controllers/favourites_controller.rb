class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favourites = Favourite.all.where(user: current_user)
  end

  def create
    @item = Item.find(params[:id])
    @user = current_user
    @favourite = @user.favourites.build(item_id: @item)
    if @favourite.save
      redirect_to user_favourites_path(@user), notice: 'Added to favourites!'
    else
      redirect_to root_path, notice: 'Failed to add to favourites!'
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_to item_path(@favourite.item)
  end
end
