FactoryBot.define do
  factory :address do
    post_code         { '123-4567' }
    prefecture_id     { '1' }
    city              { '札幌市中央区' }
    address           { '北１条東２丁目3番地' }
    building          { 'テストビル4F' }
    phone_number      { '12345678910' }
    item_id           { 1 }
  end
end
