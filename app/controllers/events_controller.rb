class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @events = Event.all
    @event_users = EventUser.all
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude
      }
    end
    if params[:query].present?
      @events = @events.where("location ILIKE ?", "%#{params[:query]}%")
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
    @event_users = EventUser.where(event_id: @event.id).map(&:user).uniq
    @markers = [
      {
        lat: @event.latitude,
        lng: @event.longitude
      }
    ]
    @events = Event.all
  end
end
