FactoryBot.define do
  factory :postcomment do
    content { "MyText" }
    post { Post.first }
    user { User.first }
  end
end
