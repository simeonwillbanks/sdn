require 'spec_helper'

describe Daily do
  context 'validations' do

  end

  let(:type) { 'Daily' }
  let(:model) { Factory(:daily) }
  it_behaves_like 'a type of moment'
end
