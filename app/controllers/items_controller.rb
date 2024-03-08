class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @items = Item.all
    # @item = Item.find_by(id: params[:id])
    if params[:query].present?
      sql_subquery = <<~SQL
        items.description ILIKE :query
        OR items.name ILIKE :query
        OR users.company ILIKE :query
      SQL
      @items = @items.joins(:user).where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def show
    @item = Item.find_by(id: params[:id])
  end
end
