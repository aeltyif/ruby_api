FactoryGirl.define do
  factory :job do
    title { Faker::Lorem.word }
    body { Faker::Lorem.paragraph }
    user_id {1}
  end
end
