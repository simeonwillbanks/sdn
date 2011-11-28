require 'spec_helper'

describe Origin do
  before { Factory(:origin) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
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

