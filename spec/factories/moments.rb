# encoding: utf-8
# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :moment do
    subject_type 'Post'
    association :subject, :factory => :post
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

