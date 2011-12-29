# encoding: utf-8
require 'spec_helper'

describe User do
  before { Factory(:user) }
  it { should validate_presence_of(:name) }
  it { should_not allow_value("blah").for(:website) }
  it { should allow_value("http://simeons.net").for(:website) }
  it { should allow_value("").for(:website) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should_not allow_value("blah").for(:email) }
  it { should allow_value("a@b.com").for(:email) }
  it { should validate_presence_of(:password) }
  it { should_not allow_mass_assignment_of(:admin) }
  it { should have_many(:comments) }
end
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  admin                  :boolean         default(FALSE)
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  authentication_token   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

