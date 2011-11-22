# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :song do
    title  { Forgery(:name).location }
    artist { Forgery(:name).last_name }
    listen { "http://#{Forgery(:internet).domain_name}" }
  end
end
