FactoryBot.define do
  factory :item do
    name { "Bob George"}
    description { "its chillin" }
     unit_price {123.45}
    merchant
  end
end