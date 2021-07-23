class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence:true do
  validates :title    
  validates :description
  validates :price
  validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :prefecture_id
    validates :burden_id
    validates :esd_id
  end

  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "¥300~¥9,999,999で入力して下さい"}


  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :burden
  belongs_to :esd
  has_one_attached :image
  has_one :purchase_history
end
