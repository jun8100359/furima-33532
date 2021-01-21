require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、first_name、last_name、first_name_kana、\
      last_name_kana、password、password_confirmation、birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'first_name、last_nameが、全角ひらがなを使っていれば登録できる' do
        @user.first_name = 'ひらがな'
        @user.last_name = 'ひらがな'
        expect(@user).to be_valid
      end

      it 'first_name、last_nameが全角カタカナを使っていれば登録できる' do
        @user.first_name = 'ナマエ'
        @user.last_name = 'ミョウジ'
        expect(@user).to be_valid
      end

      it 'first_name、last_nameが全角漢字を使っていれば登録できる' do
        @user.first_name = '名前'
        @user.last_name = '名字'
        expect(@user).to be_valid
      end

      it 'first_name_kana、last_name_kanaが、全角カタカナを使っていれば登録できる' do
        @user.first_name_kana = 'ナマエ'
        @user.last_name_kana = 'ミョウジ'
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが一致していれば登録できる' do
        @user.password = '222bbb'
        @user.password_confirmation = '222bbb'
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが半角英数字混合で記入してあれば登録できる' do
        @user.password = '222bbb'
        @user.password_confirmation = '222bbb'
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが６文字以上なら登録できる' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'birth_dayが空だと登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在していてもpassword_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = '111aaa'
        @user.password_confirmation = '222bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@が存在しないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'first_nameが全角(ひらがな・カタカナ・漢字）を使っていないと登録できない' do
        @user.first_name = 'namae'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_nameが全角（ひらがな・カタカナ・漢字）を使っていないと登録できない' do
        @user.last_name = 'myouzi'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_name_kanaが全角カタカナ以外を使うと登録できない' do
        @user.first_name_kana = '名前'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'last_name_kanaが全角カタカナ以外を使うと登録できない' do
        @user.last_name_kana = '名字'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'passwordとpassword_confirmationが英語だけで記入してあると登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordとpassword_confirmationが数字だけで記入してあると登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが６文字以上でないと登録できない' do
        @user.password = '111aa'
        @user.password_confirmation = '111aa'
        expect(@user.errors.full_messages).to include
      end
    end
  end
end
