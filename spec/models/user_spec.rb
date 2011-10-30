require 'spec_helper'

describe User do
  before { Factory(:user) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should_not allow_value("blah").for(:email) }
  it { should allow_value("a@b.com").for(:email) }
  it { should validate_presence_of(:password) }
  it { should_not allow_mass_assignment_of(:admin) }
end
