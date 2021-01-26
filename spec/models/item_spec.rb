require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができる時' do
      it 'item_name, explanation, category_id, state_id, burden_id, \
      prefectures_id, days_id, price, image, user_idがあれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない時' do
      it 'item_nameが空だと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'explanationが空だと出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'category_idが空だと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'state_idが空だと出品できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end

      it 'burden_idが空だと出品できない' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end

      it 'prefectures_idが空だと出品できない' do
        @item.prefectures_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be blank")
      end

      it 'days_idが空だと出品できない' do
        @item.days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end

      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'user_idが空だと出品できない' do
        @item.user_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it '価格が¥300より低いと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格が¥9,999,999より大きいと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '価格が半角数字以外だと出品できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格が半角英数混合では出品できない' do
        @item.price = '1000abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格が半角英語だけでは出品できない' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'category_idが1だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'category_idが数字以外だと出品できない' do
        @item.category_id = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end

      it 'state_idが１だと出品できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 1')
      end

      it 'state_idが数字以外だと出品できない' do
        @item.state_id = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include('State is not a number')
      end

      it 'burden_idが１だと出品できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden must be other than 1')
      end

      it 'burden_idが数字以外だと出品できない' do
        @item.burden_id = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden is not a number')
      end

      it 'prefectures_idが１だと出品できない' do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefectures must be other than 1')
      end

      it 'prefectures_idが数字以外だと出品できない' do
        @item.prefectures_id = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefectures is not a number')
      end

      it 'days_idが１だと出品できない' do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days must be other than 1')
      end

      it 'days_idが数字以外だと出品できない' do
        @item.days_id = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Days is not a number')
      end
    end
  end
end
