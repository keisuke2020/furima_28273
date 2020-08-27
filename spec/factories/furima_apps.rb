FactoryBot.define do
  factory :furima_app do
    number        { 4_242_424_242_424_242 }
    exp_month     { 1 }
    exp_year      { 23 }
    cvc           { 123 }
    postal_code   { 123 - 4567 }
    prefecture_id { 2 }
    city          { '大阪市' }
    house_number  { '大阪1-1' }
    building_name { '大阪ビルディング' }
    phone_number  { '09012345678' }
  end
end
