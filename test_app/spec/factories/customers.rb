FactoryBot.define do
  factory :customer, aliases: [:user] do
    transient do
      to_upcase { false }
      orders_amount { 3 }
    end

    name  { Faker::Name.first_name }
    address { Faker::Address.street_address }

    sequence(:email) { |n| "email_#{n}@email.com" }

    vip { false }
    days_to_pay { 15 }

    trait :male do
      gender { 'M' }
    end

    trait :female do
      gender { 'F' }
    end

    trait :with_orders do
      after(:create) do |customer, evaluator|
        create_list(:order, evaluator.orders_amount, customer: customer)
      end
    end

    factory :customer_vip do
      vip { true }
      days_to_pay { 30 }
    end

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.to_upcase
    end
  end
end
