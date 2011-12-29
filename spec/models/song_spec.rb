# encoding: utf-8
require 'spec_helper'

describe Song do
  context "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:artist) }
    it { should validate_presence_of(:listen) }
  end

  let(:type) { 'Song' }
  let(:model) { Factory(:song) }
  it_behaves_like "a type of moment"
end
# == Schema Information
#
# Table name: songs
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  artist     :string(255)
#  listen     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

