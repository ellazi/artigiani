class Event < ApplicationRecord
  has_many :event_users
  has_many :users, through: :event_users
  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
