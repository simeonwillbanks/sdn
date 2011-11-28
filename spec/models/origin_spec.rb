require 'spec_helper'

describe Origin do
  before { Factory(:origin) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
