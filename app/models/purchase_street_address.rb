class PurchaseStreetAddress
    include ActiveModel::Model
    attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipalities, :address, :building, :phone_number, :purchase

    validates :user_id, :item_id, presence: true
    validates :postal_code, :prefecture_id, :municipalities, :address, :phone_number, :purchase_id, presence: true
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number, format: { with: /\A\d{10}\z/ }, numericality: { less_than: 11 }

    def save
      purchase = Purchase.create(user_id: user_id, item_id: item_id)
      StreetAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
    end
end
