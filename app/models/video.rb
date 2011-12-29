# encoding: utf-8
class Video < DefaultScope
	include Momentable

  ORIGINS = %w(youtube flickr)

  validates_presence_of :title, :origin, :origin_poid
  validates_uniqueness_of :origin_poid, :scope => [:origin]
  validates_inclusion_of :origin, :in => ORIGINS

  ORIGINS.each do |origin_name|
    define_method "#{origin_name}?" do
      origin == origin_name
    end
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

