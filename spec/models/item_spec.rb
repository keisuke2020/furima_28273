require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '商品出品が出来る時' do
      it 'exhibition_image,name,product_explanation,price,
      category_id,charge_id,delivery_id,origin_id
      status_id,user_idが全て存在すれば商品出品が出来る' do
        expect(@item).to be_valid
      end

      it 'nameが40文字以内であれば商品出品が出来る' do
        @item.name = 'aaaaaaaaabbbbbbbbbbccccccccccdddddddddd'
        expect(@item).to be_valid
      end

      it 'priceが300以上であれば商品出品が出来る' do
        @item.price = 300
        expect(@item).to be_valid
      end

      it 'priceが9999999以下であれば商品出品ができる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end

    context '商品出品が出来ない時' do
      it 'exhibition_imageが空では商品出品が出来ない' do
        @item.exhibition_image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Exhibition image can't be blank")
      end

      it 'nameが空では商品出品が出来ない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameが40文字を超えると商品出品が出来ない' do
        @item.name = 'aaaaaaaaabbbbbbbbbbccccccccccdddddddddde'
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end

      it 'product_explanationが空では商品出品が出来ない' do
        @item.product_explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product explanation can't be blank")
      end

      it 'product_explanationが1000文字を超えると商品出品が出来ない' do
        @item.name = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        aaaaaaaaaaaaaaaaaaaaaaaab"
        @item.valid?
        expect(@item.errors.full_messages).to include('Product explanation is too long (maximum is 1000 characters)')
      end

      it 'category_idの値が１(空)では商品出品が出来ない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'status_idの値が１(空)では商品出品が出来ない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it 'charge_idの値が１(空)では商品出品が出来ない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Charge must be other than 1')
      end

      it 'origin_idの値が１(空)では商品出品が出来ない' do
        @item.origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Origin must be other than 1')
      end

      it 'delivery_idの値が１(空)では商品出品が出来ない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery must be other than 1')
      end

      it 'priceが空では商品出品が出来ない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceの値が300未満だと商品出品が出来ない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is too small(greater than or equal to 300)')
      end

      it 'priceの値が9999999を超えると商品出品が出来ない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is too large(less than or equal to 9999999)')
      end
    end
  end
end
