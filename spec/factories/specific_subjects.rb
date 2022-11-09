FactoryBot.define do
  factory :specific_subject do
    subject { Subject.first }
    user { User.first }
  end
end
