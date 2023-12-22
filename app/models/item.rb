class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :favorites
  has_many :favorited_by_users, through: :favorites, source: :user
end
