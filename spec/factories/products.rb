FactoryBot.define do
  factory :product do
    title {'testtitle'}
    description {'testdescription'}
    price {'10000'}
    category_id {'2'}
    status_id{'2'}
    prefecture_id{'2'}
    burden_id{'2'}
    esd_id{'2'}
    association :user 
    
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end