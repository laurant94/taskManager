FactoryBot.define do
  factory :user, class: User do
    username { "client 1" }
    email { "client1@gmail.com" }
    password { "aaaaaaaa" }
    password_confirmation { "aaaaaaaa" }
    firstname { "aaaaaaaa" }
    lastname { "aaaaaaaa" }
    active { false }
  end
  
end
