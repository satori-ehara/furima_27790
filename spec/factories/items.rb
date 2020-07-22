FactoryBot.define do
  factory :item do
    name                  { 'abe' }
    price                 { 'kkk@gmail.com' }
    user_id               { '1234qwer' }
    condition_id          { '1234qwer' }
    type_id               { '漢字' }
    burden_id             { '漢字' }
    prefectures_id        { 'カタカナ' }
    days_id               { 'カタカナ' }
  end
end
