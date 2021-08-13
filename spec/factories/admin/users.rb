FactoryBot.define do
  factory :admin_user, class: Admin::User do
    username { "client 2" }
    email { "client2@gmail.com" }
    password { "aaaaaaaa" }
    password_confirmation { "aaaaaaaa" }
    firstname { "aaaaaaaa" }
    lastname { "aaaaaaaa" }
    active { false }
  end
end
