FactoryBot.define do
  factory :invoice do
    customer { nil }
    status { "MyString" }
    merchant { nil }
  end
end
