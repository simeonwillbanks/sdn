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
