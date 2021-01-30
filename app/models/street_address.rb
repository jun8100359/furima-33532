class StreetAddress < ApplicationRecord
  belongs_to :purchase
  validates :postal_code, :prefecture_id, :municipalities, :address, :phone_number, :purchase_id, presence: true
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number, format: { with: /\A\d{10}\z/ }, numericality: { less_than: 11 }
end
