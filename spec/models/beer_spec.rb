# encoding: utf-8
require 'spec_helper'

describe Beer do
  before { Factory(:beer) }
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:brewery) }
    it { should validate_presence_of(:origin_poid) }
    it { should validate_uniqueness_of(:origin_poid) }
    it { should allow_value("http://simeons.net/icons/pbr.jpg").for(:icon) }
    it { should allow_value("").for(:icon) }
    it { should_not allow_value("blah").for(:icon) }
  end

  let(:type) { 'Beer' }
  let(:model) { Factory(:beer) }
  it_behaves_like 'a type of moment'
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

