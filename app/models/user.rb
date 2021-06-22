class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence:true do
          validates :nickname
          validates :birth
         end
         validates :email, uniqueness: true
         validates :password, format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
         validates :first_name, format:{with: /\A([ぁ-んァ-ヶ一-龥々ー])+\z/}
         validates :last_name,  format:{with: /\A([ぁ-んァ-ヶ一-龥々ー])+\z/}
         validates :first_kana, format:{with: /\A([ァ-ヶ一ー])+\z/}
         validates :last_kana,  format:{with: /\A([ァ-ヶ一ー])+\z/}

         
         has_many :products
end
