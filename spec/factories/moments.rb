# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :moment do
  end
end
# == Schema Information
#
# Table name: moments
#
#  id           :integer         not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  subject_id   :integer
#  subject_type :string(255)
#

