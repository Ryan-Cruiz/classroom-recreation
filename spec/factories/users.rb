FactoryBot.define do
  factory :user do
    first_name { "test" }
    last_name { "user" }
    email { "test@user.com" }
    password {"testpass"}
    password_confirmation {"testpass"}
    user_type {"2"}
  end
end
