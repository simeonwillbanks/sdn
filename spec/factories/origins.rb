# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :origin do
    name { Forgery(:name).location }
  end
end
# == Schema Information
#
# Table name: origins
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

