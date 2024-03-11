class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @artisans = User.all.where(is_artisan: true)
  end

  def show
    @artisan = User.all.where(is_artisan: true).find(params[:id])
    @items = Item.all.where(user_id: @artisan.id)
    @event_users = EventUser.all.where(user_id: @artisan.id).map(&:event).uniq.first(3)
  end
end
