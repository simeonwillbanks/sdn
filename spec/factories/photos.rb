# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    title       { Forgery(:lorem_ipsum).sentence(:random => true) }
    description { Forgery(:lorem_ipsum).paragraphs(1, :random => true) }
    sequence(:origin_poid) { |n| 
      photos = [5311325896, 5310734271, 5310733689, 5310733025, 5311322894, 5310731243, 6409065511, 6409063359, 6409060203, 6320363353, 6271069032, 5319016528, 5318419795, 5318422279, 5319022154, 5319023812, 5319025188, 5318428245]
      index = (n - 1) < photos.size ? n - 1 : n.to_s[-1].to_i
      photos[index]
    }
  end
end
# == Schema Information
#
# Table name: photos
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  origin_poid :integer
#  created_at  :datetime
#  updated_at  :datetime
#

