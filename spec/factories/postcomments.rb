FactoryBot.define do
  factory :postcomment do
    content { "MyText" }
    post { nil }
    user { nil }
  end
end
