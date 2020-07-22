FactoryBot.define do
  factory :item do
    name                  { 'abe' }
    description           { '説明文がここに入ります。' }
    price                 { '5000' }
    user_id               { '12' }
    condition_id          { '1' }
    type_id               { '1' }
    burden_id             { '1' }
    prefectures_id        { '1' }
    days_id               { '1' }
  end
end
