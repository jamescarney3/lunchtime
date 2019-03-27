class Order < ApplicationRecord
  validates :user, :order_group, :text, presence: true
  
  belongs_to :user
  belongs_to :order_group
end