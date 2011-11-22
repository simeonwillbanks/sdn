FactoryGirl.define do
  dummy_password = Forgery(:basic).password
  factory :user do
    name                  { Forgery(:name).full_name }
    email                 { Forgery(:internet).email_address }
    password              { dummy_password }
    password_confirmation { dummy_password }
    confirmed_at          { 1.day.ago }
  end

  factory :admin, :parent => :user do
    admin true
    authentication_token 'p6oDkqn2LVpVU3UvDJYz'
  end
end

