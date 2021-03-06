FactoryBot.define do
  factory :purchase_street_address do
    postal_code { '111-1111' }
    prefecture_id { 2 }
    municipalities { '市区町村' }
    address { '番地' }
    building { '建物' }
    phone_number { 11_111_111_111 }
    token { 'tok_abcdefghijk00000000000000000' }
    price { 1000 }
  end
end
