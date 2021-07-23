require 'rails_helper'

RSpec.describe Order, type: :model do
  before  do
    product = FactoryBot.create(:product)
    user =FactoryBot.create(:user)
    @order = FactoryBot.build(:order, product_id: product.id, user_id: user.id)
    sleep(1)
  end

  describe '住所情報の保存' do
    context '銃所を保存できる場合' do
      it '郵便番号、都道府県の選択、、市区町村、番地、建物名、電話番号を指定していれば購入できる' do
        expect(@order).to be_valid
      end
    
      it '建物名を指定しなくても購入できる' do
        @order.building = ''
        expect(@order).to be_valid
      end

      it '郵便番号にハイフンが必要であること' do
        @order.postal_code = '000-1234'
        expect(@order).to be_valid
      end

      it '電話番号は１１桁の半角数字であること' do
        @order.phone_number = '08012345678'
        expect(@order).to be_valid
      end
      
    end
    context '住所情報を保存できない場合' do
      it '郵便番号が空では出品できない' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end 

      
      it '郵便番号にハイフンがなければ保存できないできない' do
        @order.postal_code = '0001234'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      
      it '市区町村が空では保存できない' do
        @order.from_city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("From city can't be blank")
      end  

      it '番地が空では保存できない' do
        @order.from_address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("From address can't be blank")
      end  

      it '電話番号が空では保存できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end  

      it '電話番号が半角数字以外では保存できない' do
        @order.phone_number = 'あああああ'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号の数字が10桁より小さければ保存できない' do
        @order.phone_number = '080123456'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号の数字が11桁より大きい場合保存できない' do
        @order.phone_number = '080123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it '都道府県のの選択肢について、--を指定指定していると出品できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'user_idが空では購入できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'product_idが空では購入できないこと' do
        @order.product_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Product can't be blank")
      end

    end
  end
end
