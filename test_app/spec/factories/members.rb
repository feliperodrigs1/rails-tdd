FactoryBot.define do
  factory :member do
    email { Faker::Internet.email }
    password { 'secret' }
    password_confirmation { 'secret' }
  end
end
