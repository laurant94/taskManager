FactoryBot.define do
  factory :task do
    expired_at { "2021-08-26 23:45:00" }
    status { "en attente" }
    association {:user}
  end
end
