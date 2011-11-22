# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    body { Forgery(:lorem_ipsum).sentence(:random => true) }
    association :user
  end
end
# == Schema Information
#
# Table name: comments
#
#  id               :integer         not null, primary key
#  body             :text
#  user_id          :integer
#  commentable_id   :integer
#  commentable_type :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

