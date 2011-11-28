# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    title       { Forgery(:lorem_ipsum).sentence(:random => true) }
    description { Forgery(:lorem_ipsum).paragraphs(1, :random => true) }
    sequence(:origin_poid) {|n| n }
  end
end
