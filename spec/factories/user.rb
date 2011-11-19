FactoryGirl.define do
  factory :user do
    name "dude"
    sequence(:email){|n| "email#{n}@factory.com" }
    password "foobar"
    password_confirmation "foobar"
    confirmed_at 1.day.ago
  end

  factory :admin, :parent => :user do
    admin true
    authentication_token 'p6oDkqn2LVpVU3UvDJYz'
  end
end

