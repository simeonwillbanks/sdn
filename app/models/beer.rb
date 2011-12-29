# encoding: utf-8
class Beer < DefaultScope
	include Momentable

  validates_presence_of :name, :brewery, :origin_poid
  validates_uniqueness_of :origin_poid
  validates_format_of :icon, :with => URI::regexp(%w(http https)), :if => lambda { icon? }
end
# == Schema Information
#
# Table name: beers
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  brewery     :string(255)
#  description :text
#  icon        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  origin_poid :integer(8)
#

