# encoding: utf-8
class Photo < DefaultScope
	include Momentable
  validates_presence_of :title, :origin_poid
  validates_uniqueness_of :origin_poid
end
# == Schema Information
#
# Table name: photos
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  origin_poid :integer(8)
#  created_at  :datetime
#  updated_at  :datetime
#

