FactoryBot.define do
  factory :post do
    title { "MyString" }
    content { "MyText" }
    due_date { "2022-10-15" }
    user { nil }
    subject { nil }
  end
end
