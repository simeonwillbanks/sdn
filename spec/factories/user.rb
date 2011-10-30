FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "email#{n}@factory.com" }
    password "foobar"
    password_confirmation "foobar"
    confirmed_at 1.day.ago
  end

  factory :admin, :parent => :user do
    admin true
  end
end

