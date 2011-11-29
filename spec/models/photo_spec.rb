require 'spec_helper'

describe Photo do
  context 'validations' do
    before { Factory(:photo) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:origin_poid) }
    it { should validate_uniqueness_of(:origin_poid) }
  end

  let(:type) { 'Photo' }
  let(:model) { Factory(:photo) }
  it_behaves_like 'a type of moment'
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

