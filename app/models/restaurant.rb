class Restaurant < ApplicationRecord
  validates :name, :menu_url, presence: true
  validates :name, :menu_url, uniqueness: true
end