require 'spec_helper'

describe Daily do
  context 'validations' do
    before { Factory(:daily) }
    it { should validate_presence_of(:origin_poid) }
    it { should validate_uniqueness_of(:origin_poid) }
  end

  let(:type) { 'Daily' }
  let(:model) { Factory(:daily) }
  it_behaves_like 'a type of moment'
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

