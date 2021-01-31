require 'rails_helper'

RSpec.describe PurchaseStreetAddress, type: :model do
  before do
    @buy = FactoryBot.build(:purchase_street_address)
  end

  describe '商品の購入' do
    context '商品の購入ができる時' do
      it 'postal_code, prefecture_id, municipalities, address, phone_number, \
      building, token, priceが全て入力されていると登録できる' do
        expect(@buy).to be_valid
      end

      it 'buildingが入力されていなくても登録できる' do
        @buy.building = nil
        expect(@buy).to be_valid
      end
    end

    context '商品の購入ができない時' do
      it 'postal_codeが空だと登録できない' do
        @buy.postal_code = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'prefecture_idが1だと登録できない' do
        @buy.prefecture_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalitiesが空だと登録できない' do
        @buy.municipalities = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'addressが空だと登録できない' do
        @buy.address = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと登録できない' do
        @buy.phone_number = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'tokenが空だと登録できない' do
        @buy.token = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Token can't be blank")
      end

      it 'priceが空だと登録できない' do
        @buy.price = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Price can't be blank")
      end

      it 'user_idが空だと登録できない' do
        @buy.user_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと登録できない' do
        @buy.item_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Item can't be blank")
      end

      it 'prefecture_idが数字以外だと登録できない' do
        @buy.prefecture_id = 'a'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Prefecture is not a number')
      end

      it 'postal_codeはハイフンがないと登録できない' do
        @buy.postal_code = '1111111'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Postal code is invalid')
      end

      it 'postal_codeはハイフンの前3文字でないと登録できない' do
        @buy.postal_code = '1111-1111'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Postal code is invalid')
      end

      it 'postal_codeはハイフンの後4文字でないと登録できない' do
        @buy.postal_code = '111-111'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Postal code is invalid')
      end

      it 'postal_codeは半角数字でないと登録できない' do
        @buy.postal_code = '１１１-１１１１'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Postal code is invalid')
      end

      it 'phone_numberは11字以内でないと登録できない' do
        @buy.phone_number = 111_111_111_112
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberは半角数字でないと登録できない' do
        @buy.phone_number = '１１１１１１１１１１１'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
