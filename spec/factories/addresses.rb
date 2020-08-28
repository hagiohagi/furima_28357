FactoryBot.define do
  factory :address do
    association order

    postal_code { 123 - 4567 }
    prefecture_id { 1 }
    city { 新宿区 }
    house_number { 1 - 1 - 1 }
    building_name {}
    phone_number { 0o0000000000 }
    order_id { 1 }
  end
end
