FactoryBot.define do
  factory :comment do
    imageable { nil }
    content { "MyText" }
    user { nil }
  end
end
