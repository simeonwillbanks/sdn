class Photo < DefaultScope
	include Momentable
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

