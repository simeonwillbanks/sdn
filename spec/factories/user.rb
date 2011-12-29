# encoding: utf-8
FactoryGirl.define do
  factory :user do
    name                  { Forgery(:name).full_name }
    email                 { Forgery(:internet).email_address }
    password              'foobar'
    password_confirmation 'foobar'
    confirmed_at          1.day.ago
  end

  factory :admin, :parent => :user do
    admin true
    authentication_token 'p6oDkqn2LVpVU3UvDJYz'
  end
end

