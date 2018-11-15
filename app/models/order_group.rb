class OrderGroup < ApplicationRecord
  validates :user_id, :restaurant_id, presence: true
  
  belongs_to :user
  belongs_to :restaurant
  has_many :orders
  has_many :users, through: :orders
end