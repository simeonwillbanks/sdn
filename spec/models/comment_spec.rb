require 'spec_helper'

describe Comment do
  context "validations" do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:user) }
    it { should belong_to(:user) }
    it { should belong_to(:commentable) }
  end
end
# == Schema Information
#
# Table name: comments
#
#  id               :integer         not null, primary key
#  body             :text
#  user_id          :integer
#  commentable_id   :integer
#  commentable_type :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

