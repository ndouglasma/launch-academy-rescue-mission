FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Nisha Douglas #{n}" }
    created_at Time.now
    updated_at Time.now
  end
end
