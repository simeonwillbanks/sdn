require 'spec_helper'

describe MomentsPresenter do
  
  # TODO why must I specify the subject like this?
  # Without this line, subject.index throws a NoMethodError
  subject { MomentsPresenter }
  let(:model) { Moment }
  
  it_behaves_like "index presenter"
  
end
