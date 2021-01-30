class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :day

  validates :image, :item_name, :explanation, :category_id, :state_id, :burden_id, :prefecture_id, :day_id, :price,
            presence: true
  validates :category_id, :state_id, :burden_id, :prefecture_id, :day_id, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }
  has_one_attached :image
  belongs_to :user
  has_one :purchase
end
