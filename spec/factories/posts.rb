# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    headline "MyString"
    body "MyText"
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

