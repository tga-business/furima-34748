require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context'新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name，first_kanaとlast_kana，birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end

    end


    context'新規登録できないとき'do
    it 'nicknameが空では登録できないこと' do
      @user.nickname =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end


    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが数字のみであれば登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが英語のみであれば登録できないこと' do
      @user.password = 'abcdefg'
      @user.password_confirmation = 'abcdefg'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが全角文字であれば登録できないこと' do
      @user.password = 'ｑｗｑｗｑｗｑｗ'
      @user.password_confirmation = 'ｑｗｑｗｑｗｑｗ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'last_nameが空では登録できないこと'do
     @user.last_name = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Last name is invalid")
    end  

    it 'first_nameが空では登録できないこと'do
     @user.first_name = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("First name is invalid")
    end  

    it 'last_kanaが空では登録できないこと'do
     @user.last_kana = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Last kana is invalid")
    end  

   it 'first_kanaが空では登録できないこと'do
     @user.first_kana = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("First kana is invalid")
    end 

    it 'last_nameが漢字、ひらがな、カタカナでなければ登録できないこと' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end 

    it 'first_nameが漢字、ひらがな、カタカナでなければ登録できないこと'do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end 

  it 'last_kanaのフリガナがカタカナでなければ登録できないこと'do
    @user.last_kana = 'やまだ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Last kana is invalid")
  end  

    it 'first_kanaのフリガナがカタカナでなければ登録できないこと'do
      @user.first_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana is invalid")
    end  

    it 'birthが空では登録できないこと'do
      @user.birth = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end

  end
  end
end