require 'spec_helper'

describe Photo do
  context 'validations' do

  end

  let(:type) { 'Photo' }
  let(:model) { Factory(:photo) }
  it_behaves_like 'a type of moment'
end
# == Schema Information
#
# Table name: photos
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  origin_poid :integer
#  created_at  :datetime
#  updated_at  :datetime
#

