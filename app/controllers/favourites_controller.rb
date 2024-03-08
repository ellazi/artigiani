class FavouritesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @favourites = Favourite.all.where(user: current_user)
  end

  def create
    @favourite = Favourite.new
    @item = Item.find(params[:item_id]).id
    @favourite.item_id = @item
    @favourite.user_id = current_user.id
    if @favourite.save
      redirect_to favourites_path, notice: 'Added to favourites!'
    else
      # Output errors to your logs or console for debugging
      Rails.logger.error @favourite.errors.full_messages.join(", ")

      # Optionally, you can flash the error messages to the user
      flash[:alert] = @favourite.errors.full_messages.join(", ")
      redirect_to items_path
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_to favourites_path, notice: 'Removed from favourites!'
  end
end
