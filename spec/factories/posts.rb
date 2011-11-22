# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    headline { Forgery(:lorem_ipsum).sentence(:random => true) }
    body     { Forgery(:lorem_ipsum).paragraphs(2, :random => true) }
  end
end
# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  headline   :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

