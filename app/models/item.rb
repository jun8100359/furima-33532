class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :choice
  validates :item_name, :explanation, :category_id, :state_id, :burden_id, :prefectures_id, :days_id, :price, presence: true
  validates :category_id, :state_id, :burden_id, :prefectures_id, :days_id, numericality: { other_than: 1 }
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: {with: /\A[0-9]+\z/ }
  has_one_attached :image
end
