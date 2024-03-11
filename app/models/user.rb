class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :event_users
  has_many :events, through: :event_users
  has_many :items, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favourited_items, through: :favourites, source: :item
  geocoded_by :location, if: :present?
  after_validation :geocode, if: :will_save_change_to_location?
end
