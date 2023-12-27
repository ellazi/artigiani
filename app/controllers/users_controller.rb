class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @artisans = User.all.where(is_artisan: true)
  end

  def show
    @artisan = User.find(params[:id])
  end
end
