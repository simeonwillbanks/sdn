# encoding: utf-8
# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :daily do
    sequence(:origin_poid) {|n| n }
  end
end
# == Schema Information
#
# Table name: dailies
#
#  id          :integer         not null, primary key
#  origin_poid :integer
#  created_at  :datetime
#  updated_at  :datetime
#

