class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :items, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favourited_items, through: :favourites, source: :item
end
