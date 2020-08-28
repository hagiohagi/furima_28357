FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 3 }
    city { '新宿区' }
    house_number { '1-1-1' }
    building_name { '101号室' }
    phone_number { '00000000000' }
    user_id { 1 }
    item_id { 1 }
    token { 'qawsderftgyhujikolp' }
  end
end
