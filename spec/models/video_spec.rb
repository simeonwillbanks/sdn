require 'spec_helper'

describe Video do
  context 'validations' do
    before { Factory(:video) }
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
      Factory.build(:video, :origin => 'flickr').flickr?.should eq(true)
    end
    it 'can come from YouTube' do
      Factory.build(:video, :origin => 'youtube').youtube?.should eq(true)
    end
  end

  let(:type) { 'Video' }
  let(:model) { Factory(:video) }
  it_behaves_like 'a type of moment'
end
