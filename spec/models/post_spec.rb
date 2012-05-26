# encoding: utf-8
require 'spec_helper'

describe Post do
  context "validations" do
    before { FactoryGirl.create(:post) }
    it { should validate_presence_of(:headline) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:origin) }
    it { should validate_presence_of(:origin_poid) }
    it { should validate_uniqueness_of(:origin_poid).scoped_to(:origin) }
    it { should_not allow_value('blah').for(:origin) }
    it { should allow_value('posterous').for(:origin) }
    it { should allow_value('movabletype').for(:origin) }
  end

  context 'origins' do
    it 'can come from Posterous' do
      FactoryGirl.build(:post, :origin => 'posterous').posterous?.should eq(true)
    end
    it 'can come from MovableType' do
      FactoryGirl.build(:post, :origin => 'movabletype').movabletype?.should eq(true)
    end
  end

 let(:type) { 'Post' }
  let(:model) { FactoryGirl.create(:post) }
  it_behaves_like "a type of moment"
end
# == Schema Information
#
# Table name: posts
#
#  id          :integer         not null, primary key
#  headline    :string(255)
#  body        :text
#  created_at  :datetime
#  updated_at  :datetime
#  origin_poid :integer(8)
#  origin      :string(255)
#

