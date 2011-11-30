# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beer do
    name  { Forgery(:name).location }
    brewery { Forgery(:name).last_name }
    description { Forgery(:lorem_ipsum).paragraphs(1, :random => true) }
    sequence(:origin_poid) {|n| n }
    icon "https://untappd.s3.amazonaws.com/site/assets/images/temp/badge-beer-default.png"
  end
end
# == Schema Information
#
# Table name: beers
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  brewery     :string(255)
#  description :text
#  icon        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  origin_poid :integer(8)
#

