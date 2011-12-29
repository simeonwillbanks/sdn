# encoding: utf-8
class Daily < DefaultScope
	include Momentable
  validates_presence_of :origin_poid
  validates_uniqueness_of :origin_poid
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

