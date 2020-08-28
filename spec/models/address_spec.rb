require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '商品購入機能' do
    before do
      @address = FactoryBot.build(:address)
    end
    
    context '商品購入がうまくいくとき' do
      it 'postal_codeとprefectuire_idとcityとhouse_numberとphone_number_とorder_idが存在すれば登録できる' do
        expect(@address).to be_valid
      end
      it 'postal_codeがハイフン含めた7桁の数字なら登録できる'
        @address.postal_code = '123-4567'
        expect(@address).to be_valid
      end
      it 'phone_numberが11桁の数字なら登録できる'
        @address.postal_code = '12345678901'
        expect(@address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'postal_codeが空では保存できないこと' do
        @address.postal_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal_code can't be blank")
    end
    it 'prefecture_idが空では保存できないこと' do
      @address.prefecture_id = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Prefecture_id can't be blank")
    end
    it 'cityが空では保存できないこと' do
      @address.city = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空では保存できないこと' do
      @address.house_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("House_number can't be blank")
    end
    it 'phone_numberが空では保存できないこと' do
      @address.phone_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone_number can't be blank")
    end
    it 'order_idが空では保存できないこと' do
      @address.order_id = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Order_id can't be blank")
    end
    it "prefecture_idの値が、id:0,name:'--'の時は保存できないこと" do
      @order.prefecture_id = [0]
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
    end
    it 'postal_codeが6桁以下だと登録できないこと'
        @address.postal_code = '123456'
        expect(@address).to be_valid
        @address.valid?
        expect(@address.errors.full_messages).to include('Postal_code is is too short(minimum is 7 characters)')
      end
      it 'postal_codeが8桁以上だと登録できないこと'
        @address.postal_code = '12345678'
        expect(@address).to be_valid
        @address.valid?
        expect(@address.errors.full_messages).to include('Postal_code is too long(maximum is 7 characters)')
      end
    it 'postal_codeがハイフンがないと登録できないこと'
        @address.postal_code = '1234567'
        expect(@address).to be_valid
        @address.valid?
        expect(@address.errors.full_messages).to include('Postal_code is invalid')
      end
      it 'phone_numberが10桁以下だとの数字なら登録できない'
        @address.postal_code = '1234567890'
        expect(@address).to be_valid
        address.valid?
        expect(@address.errors.full_messages).to include('Phone_number is too short(minimum is 11 characters)')
      end
      it 'phone_numberが12桁以上だとの数字なら登録できない'
        @address.postal_code = '123456789012'
        expect(@address).to be_valid
        address.valid?
        expect(@address.errors.full_messages).to include('Phone_number is too long(maximum is 11 characters)')
      end
  end
end
