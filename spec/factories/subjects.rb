FactoryBot.define do
  factory :subject do
    title { "testSub" }
    section { "test 1" }
    user { User.first }
  end
end
