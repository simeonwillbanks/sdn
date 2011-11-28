# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :origin do
    name { Forgery(:name).location }
  end
end
