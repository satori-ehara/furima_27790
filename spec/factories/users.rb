FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'kkk@gmail.com' }
    password              { '1234qwer' }
    password_confirmation { '1234qwer' }
    first_name_kanji      { '漢字' }
    last_name_kanji       { '漢字' }
    first_name_katakana   { 'カタカナ' }
    last_name_katakana    { 'カタカナ' }
    Birthday_year         { '1999' }
    Birthday_month        { '7' }
    Birthday_day          { '25' }
  end
end
