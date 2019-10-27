class Room < ApplicationRecord
  validates :name, presence: true, length: {maximum: 50}, uniqueness: true
  validates :price, presence: true, numericality: {less_than: 10000000}
  validates :capacity, presence: true, numericality: { greater_than: 0, less_than: 10000000 }
  validates :open_at, presence: true
  validates :close_at, presence: true
end
