# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    sequence(:headline) { |n| "My Headline #{n}" }  
    sequence(:body)     { |n| "Body #{n}" * 10 }  
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

