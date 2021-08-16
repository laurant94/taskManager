FactoryBot.define do
  factory :label do
    name {"Pies"}
    user
  end

  factory :user10 do
    username { "client 10" }
    email { "client10@gmail.com" }
    password { "aaaaaaaa" }
    password_confirmation { "aaaaaaaa" }
    firstname { "aaaaaaaa" }
    lastname { "aaaaaaaa" }
    active { true }
  end

end
