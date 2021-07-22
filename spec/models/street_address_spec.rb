require 'rails_helper'

RSpec.describe StreetAddress, type: :model do
  before do
    @street_address = FactoryBot.build(:street_address)
  end

  describe '住所情報の保存' do
    context '銃所を保存できる場合' do
      it '郵便番号、都道府県の選択、、市区町村、番地、建物名、電話番号を指定していれば購入できる' do
        expect(@street_address).to be_valid
      end
    
      it '建物名を指定しなくても購入できる' do
        @street_address.building = ''
        expect(@product).to be_valid
      end

      it '郵便番号にハイフンが必要であること' do
        @product.price = 000-1234
        expect(@product).to be_valid
      end

      it '電話番号は１１桁の半角数字であること' do
        @street_address.phone_number = 08012345678
        expect(@street_address).to be_valid
      end
      
    end
    context '住所情報を保存できない場合' do
      it '郵便番号が空では出品できない' do
        @street_address.postal_code = nil
        @st[].valid?
        expect(@street_address.errors.full_messages).to include("Postal code can't be blank")
      end 

      it '郵便番号の数字が７桁より少なければ登録できない' do
        
      end

      it '郵便番号にハイフンがなければ保存できないできない' do
        @product.postal_code = 0001234
        @product.valid?
        expect(@product.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      
      it '市区町村が空では保存できない' do
        @street_address.title = ''
        @street_address.valid?
        expect(@street_address.errors.full_messages).to include("From city can't be blank")
      end  

      it '番地が空では保存できない' do
        @street_address.from_address = ''
        @street_address.valid?
        expect(@street_address.errors.full_messages).to include("From address can't be blank")
      end  

      it '電話番号が空では保存できない' do
        @street_address.phone_number = ''
        @street_address.valid?
        expect(@street_address.errors.full_messages).to include("Phone number can't be blank")
      end  

      it '電話番号が半角数字以外では保存できない' do
        @street_address.phone_number = 'あああああ'
        @street_address.valid?
        expect(@product.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号の数字が１１桁より小さければ保存できない' do
        @street_address.phone_number = '0801234567'
        @street_address.valid?
        expect(@street_address.errors.full_messages).to include("Phone number is invalid")
      end


      it '都道府県のの選択肢について、--を指定指定していると出品できない' do
        @street_address.prefecture_id = 1
        @street_address.valid?
        expect(@street_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

    end
  end
end
