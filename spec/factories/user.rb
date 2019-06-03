FactoryBot.define do
  factory :user do
    email { "weatherman@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
