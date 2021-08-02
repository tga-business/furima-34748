class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :from_city, :from_address, :building, :phone_number, :prefecture_id, :purchase_history, :product_id, :user_id, :token

  # ここにバリデーションの処理を書く
  with_options presence:true do
    validates :postal_code
    validates :from_city
    validates :from_address
     validates :phone_number, format: {with: /\A\d{10,11}\z/}
     validates :product_id
     validates :user_id
     validates :token
  end
   validates :prefecture_id, numericality: {other_than: 1 }
   validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  
  def save
    # 寄付情報を保存し、変数donationに代入する
    purchase_history = PurchaseHistory.create(product_id: product_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    StreetAddress.create(postal_code: postal_code, from_city: from_city, from_address: from_address, building: building, phone_number: phone_number, prefecture_id: prefecture_id,  purchase_history: purchase_history)
  end
end