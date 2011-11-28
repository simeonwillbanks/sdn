class Daily < DefaultScope
	include Momentable
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

