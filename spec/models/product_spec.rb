require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '出品内容の保存' do
    context '商品を出品できる場合' do
      it '画像、商品名、値段、商品の詳細の選択、配送についての選択を指定していれば投稿できる' do
        expect(@product).to be_valid
      end
    
      it '値段が300円以上であれば投稿できる' do
        expect(@product).to be_valid
      end

      it 'カテゴリーの選択肢について、--以外の選択肢を指定していれば投稿できる' do
        @product.category_id
        expect(@product).to be_valid
      end

      it '商品の状態の選択肢について、--以外の選択肢を指定していれば投稿できる' do
        @product.status_id
        expect(@product).to be_valid
      end

      it '配送料の負担の選択肢について--以外の選択肢を指定していれば投稿できる' do
        @product.burden_id
        expect(@product).to be_valid
      end

      it '発送元の地域の選択肢について--以外の選択肢を指定していれば投稿できる' do
        @product.prefecture_id
        expect(@product).to be_valid
      end

      it '発送までの日数の選択肢について--以外の選択肢を指定していれば投稿できる' do
        @product.esd_id
        expect(@product).to be_valid
      end


    end
    context '商品を出品できない場合' do
      it '画像が空では出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end 

      it '商品名が空では投稿できない' do
        @product.title = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Title can't be blank")
      end  

      it '商品の説明が空では投稿できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end  

      it '値段が空では投稿できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end  

      it 'カテゴリーの選択肢について、--を指定していると出品できない' do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態の選択肢について、--を指定指定していると出品できない' do
        @product.status_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Status must be other than 1")
      end

      it '配送料の負担の選択肢について、--を指定指定していると出品できない' do
        @product.burden_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Burden must be other than 1")
      end

      it '発送元の地域の選択肢について、--を指定指定していると出品できない' do
        @product.prefecture_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '発送までの日数の選択肢について、--を指定指定していると出品できない' do
        @product.esd_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Esd must be other than 1")
      end


      it 'ユーザーが紐付いていなければ投稿できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end

    end
  end
end