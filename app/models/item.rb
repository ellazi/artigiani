class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :favourites
  has_many :favourited_by_users, through: :favourites, source: :user
end
