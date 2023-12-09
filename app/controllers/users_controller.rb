class UsersController < ApplicationController
  def index
    @artisans = User.all.where(is_artisan: true)
  end

  def show
    @artisan = User.find(params[:id])
  end
end
