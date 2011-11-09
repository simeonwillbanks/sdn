require 'spec_helper'

describe Moment do
  it { should belong_to(:subject) }
end
# == Schema Information
#
# Table name: moments
#
#  id           :integer         not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  subject_id   :integer
#  subject_type :string(255)
#

