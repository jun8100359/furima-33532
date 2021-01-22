class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :choice
  validates :item_name, :explanation, :category_id, :state_id, :burden_id, :prefectures_id, :days_id, :price, presence: true
  validates :category_id, :state_id, :burden_id, :prefectures_id, :days_id, numericality: { other_than: 1 }
end
