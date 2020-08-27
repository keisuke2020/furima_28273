require 'rails_helper'

RSpec.describe FurimaApp, type: :model do
  describe '商品購入結果の保存' do
    before do
      @furima_app = FactoryBot.build(:furima_app)
    end
    context '商品購入結果が保存出来る時' do
      it '全ての値が正しく入力されれば保存出来ること' do
        expect(@furima_app).to be_valid
      end

      it 'building_nameが空でも保存出来ること' do
        @furima_app.building_name = nil
        expect(@furima_app).to be_valid
      end
    end

    context '商品購入結果が保存出来ない時' do
      it 'postal_codeが空では保存できないこと' do
        @furima_app.postal_code = nil
        @furima_app.valid?
        expect(@furima_app.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンが無ければ保存できないこと' do
        @furima_app.postal_code = 1_234_567
        @furima_app.valid?
        expect(@furima_app.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが1の値では保存できないこと' do
        @furima_app.prefecture_id = 1
        @furima_app.valid?
        expect(@furima_app.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'cityが空では保存できないこと' do
        @furima_app.city = nil
        @furima_app.valid?
        expect(@furima_app.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では保存できないこと' do
        @furima_app.house_number = nil
        @furima_app.valid?
        expect(@furima_app.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空では保存できないこと' do
        @furima_app.phone_number = nil
        @furima_app.valid?
        expect(@furima_app.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが12桁以上では保存できないこと' do
        @furima_app.phone_number = 123_456_789_012
        @furima_app.valid?
        expect(@furima_app.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
    end
  end
end
