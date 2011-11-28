require 'spec_helper'

describe Photo do
  context 'validations' do

  end

  let(:type) { 'Photo' }
  let(:model) { Factory(:photo) }
  it_behaves_like 'a type of moment'
end
