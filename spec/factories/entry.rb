FactoryGirl.define do
  factory :entry do
    name { SecureRandom.uuid }
    category
  end
end
