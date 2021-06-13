require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができるとき' do
      it 'name、content、category_id、condition_id、dilivery_charge_burden_id、delivery_area_id、delivery_day_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができないとき' do
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'conetentが空では出品できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'category_idがからでは出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idについての情報がなければ出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'condition_idがからでは出品できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'condition_idについての情報がなければ出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it 'delivery_charge_burden_idがからでは出品できない' do
        @item.delivery_charge_burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge burden can't be blank")
      end
      it 'delivery_charge_burden_idについての情報がなければ出品できない' do
        @item.delivery_charge_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge burden must be other than 1")
      end
      it 'delivery_area_idがからでは出品できない' do
        @item.delivery_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end
      it 'delivery_area_idについての情報がなければ出品できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area must be other than 1")
      end
      it 'delivery_day_idがからでは出品できない' do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it 'delivery_day_idについての情報がなければ出品できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
      end
      it 'priceが空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300以下では出品できない' do
        @item.price = 30
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが9999999以上では出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが全角文字では出品できない' do
        @item.price = '７７７'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが英数字混合では出品できない' do
        @item.price = '23sa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角英字では出品できない' do
        @item.price = 'tomato'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
