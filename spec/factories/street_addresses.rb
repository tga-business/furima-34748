FactoryBot.define do
  factory :street_address do
      postal_code {'111-1111'}
      from_city {'テスト街'}
      from_address {'テスト111'}
      building {'32番地'}
      phone_number{'08012345678'}
      prefecture_id{2}
      # association :product, :purchase_history      
  end
    
end
