class Order < ApplicationRecord
  validates :user_id, :order_group, :text, presence: true
  
  belongs_to :user
  belongs_to :order_group
end