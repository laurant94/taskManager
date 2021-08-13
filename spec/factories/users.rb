FactoryBot.define do
  factory :user, class: Admin::User do
    username { "client 1" }
    email { "client1@gmail.com" }
    password { "aaaaaaaa" }
    password_confirmation { "aaaaaaaa" }
    firstname { "aaaaaaaa" }
    lastname { "aaaaaaaa" }
    active { false }
  end
  factory :admin_user1, class: Admin::User do
    username { "client 2" }
    email { "client2@gmail.com" }
    password { "aaaaaaaa" }
    password_confirmation { "aaaaaaaa" }
    firstname { "aaaaaaaa" }
    lastname { "aaaaaaaa" }
    active { false }
  end
end
