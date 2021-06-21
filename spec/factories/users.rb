FactoryBot.define do
  factory :user do
    nickname {'testuser'}
    email {Faker::Internet.free_email}
    password {'abc1234'}
    password_confirmation {password}
    first_name{'山田'}
    last_name{'太郎'}
    first_kana{'ヤマダ'}
    last_kana{'タロウ'}
    birth {"1930-03-03"}
  end
end
