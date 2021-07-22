class PurchaseHistory < ApplicationRecord
  

  belongs_to :user
  belongs_to :product
  has_one    :street_address
end
