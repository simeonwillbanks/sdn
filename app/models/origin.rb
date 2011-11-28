class Origin < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
end
# == Schema Information
#
# Table name: origins
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

