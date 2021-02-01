class PurchaseStreetAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipalities, :address, :building, :phone_number,
                :purchase, :token, :price

  with_options presence: true do
    validates :municipalities, :address, :token, :price, :user_id, :item_id
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    StreetAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities,
                         address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
