require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '配送先情報の保存' do
    context '内容に問題がない場合' do
      it "priceとtokenがあれば保存ができること" do
        expect(@order_form).to be_valid
      end

      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end

      it 'user_idが空でなければ保存できる' do
        @order_form.user_id = 1
        expect(@order_form).to be_valid
      end

      it 'item_idが空でなければ保存できる' do
        @order_form.item_id = 1
        expect(@order_form).to be_valid
      end

      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @order_form.postal_code = '123-4560'
        expect(@order_form).to be_valid
      end

      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @order_form.prefecture_id = 1
        expect(@order_form).to be_valid
      end

      it '市区町村が空でなければ保存できる' do
        @order_form.city = '横浜市'
        expect(@order_form).to be_valid
      end

      it '番地が空でなければ保存できる' do
        @order_form.address = '旭区１２３'
        expect(@order_form).to be_valid
      end

      it '建物名が空でも保存できる' do
        @order_form.building = nil
        expect(@order_form).to be_valid
      end

      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @order_form.phone_number = '12345678910'
        expect(@order_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'user_idが空だと保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end

      it '郵便番号が空だと保存できないこと' do
        @order_form.postal_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンがないと保存できないこと' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県が「---」だと保存できないこと' do
        @order_form.prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県が空だと保存できないこと' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空だと保存できないこと' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと保存できないこと' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと保存できないこと' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号にハイフンがあると保存できないこと' do
        @order_form.phone_number = '123 - 1234 - 1234'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid. Enter only numbers')
      end

      it '電話番号が12桁以上あると保存できないこと' do
        @order_form.phone_number = '12345678910123111'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid. Enter only numbers')
      end

      it 'トークンが空だと保存できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end