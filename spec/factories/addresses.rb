FactoryBot.define do
  factory :address do
    post_code         { 'abe' }
    prefecture_id     { '説明文がここに入ります。' }
    city              { '5000' }
    address           { '12' }
    building          { '1' }
    phone_number      { '1' }
    item_id           { '1' }
  end
end
