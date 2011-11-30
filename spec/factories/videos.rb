# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
    title       { Forgery(:lorem_ipsum).sentence(:random => true) }
    description { Forgery(:lorem_ipsum).paragraphs(1, :random => true) }
    sequence(:origin_poid) { |n| 
      videos = ['mSQvLYMpqU4', 'imcRavEdKj0', '3P_eDC1zWJE', 'IhJTTRJbJ2Q', 'qgjWZXnTn9A', 'vF8vZM-O3hc', '3P_eDC1zWJE', 'm7tM9ce8u5A', 'OaQsiEedR4o', 'w9fDIP-3DlY', 'w73nKuS0Cpk', 'HOjmhXEzZeA']
      index = (n - 1) < videos.size ? n - 1 : n.to_s[-1].to_i
      videos[index]
    }
    origin 'youtube'
  end
end
# == Schema Information
#
# Table name: videos
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  origin_poid :string(255)
#  origin      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

