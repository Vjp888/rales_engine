FactoryBot.define do
  factory :invoice_item do
    item { nil }
    invoice { nil }
    unit_price { 1 }
    quantity { 1 }
  end
end
