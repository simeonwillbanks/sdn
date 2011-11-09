require 'spec_helper'

describe Post do
  context "validations" do
    it { should validate_presence_of(:headline) }
    it { should validate_presence_of(:body) }
  end

  let(:type) { 'Post' }
  let(:model) { Factory(:post) }
  it_behaves_like "a type of moment"
end
# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  headline   :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

