FactoryBot.define do
  factory :post do
    title { "MyString" }
    content { "MyText" }
    due_date { "2022-10-31 20:39:20" }
    subject { nil }
    user { nil }
  end
end
