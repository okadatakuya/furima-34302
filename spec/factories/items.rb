FactoryBot.define do
  factory :item do
    name {'商品名'}
    content {'商品内容'}
    category_id {2}
    condition_id {2}
    delivery_charge_burden_id {2}
    delivery_area_id {2}
    delivery_day_id {2}
    price {500}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
