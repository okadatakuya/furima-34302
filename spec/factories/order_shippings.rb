FactoryBot.define do
  factory :order_shipping do
    postal_code { '123-4567' }
    delivery_area_id { 1 }
    municipality { '東京都中央区' }
    address { '呉4-3-2' }
    building_name { '東京ハイツ' }
    phone_number { 9876543211 }
    token {"tok_abcdefghijk00000000000000000"}

  end
end
