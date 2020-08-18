FactoryBot.define do
  factory :item do
    image                { '#<ActionDispatch::Http::UploadedFile:0x00007fbc1a36b658>' }
    name                 { 'テスト商品' }
    product_explanation  { '説明文です' }
    price                { 500 }
    category_id          { 2 }
    charge_id            { 2 }
    delivery_id          { 2 }
    origin_id            { 2 }
    status_id            { 2 }
    user_id              { 2 }
    association :user
  end
end
