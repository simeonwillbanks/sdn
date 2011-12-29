# encoding: utf-8
# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :song do
    title  { Forgery(:name).location }
    artist { Forgery(:name).last_name }
    listen { "http://#{Forgery(:internet).domain_name}" }
  end
end
# == Schema Information
#
# Table name: songs
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  artist     :string(255)
#  listen     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

