class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence:true do
          validates :nickname
          validates :birth
          validates :first_name
          validates :last_name
          validates :first_kana
          validates :last_kana
         end
         validates :email, uniqueness: true
         validates :password, format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
         with_options  format:{with: /\A([ぁ-んァ-ヶ一-龥々ー])+\z/} do
          validates :first_name
          validates :last_name
         end
         with_options format:{with: /\A([ァ-ヶ一ー])+\z/} do
           validates :first_kana
           validates :last_kana
         end

         
         has_many :products
         has_many :purchase_histories	
end
