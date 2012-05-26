# encoding: utf-8
require 'spec_helper'

describe Video do
  context 'validations' do
    before { FactoryGirl.create(:video) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:origin) }
    it { should validate_presence_of(:origin_poid) }
    it { should validate_uniqueness_of(:origin_poid).scoped_to(:origin) }
    it { should_not allow_value('blah').for(:origin) }
    it { should allow_value('youtube').for(:origin) }
    it { should allow_value('flickr').for(:origin) }
  end

  context 'origins' do
    it 'can come from Flickr' do
      FactoryGirl.build(:video, :origin => 'flickr').flickr?.should eq(true)
    end
    it 'can come from YouTube' do
      FactoryGirl.build(:video, :origin => 'youtube').youtube?.should eq(true)
    end
  end

  let(:type) { 'Video' }
  let(:model) { FactoryGirl.create(:video) }
  it_behaves_like 'a type of moment'
end
# == Schema Information
#
# Table name: videos
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  origin_poid :string(255)
#  origin      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

