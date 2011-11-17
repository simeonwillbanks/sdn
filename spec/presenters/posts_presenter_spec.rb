require 'spec_helper'

describe PostsPresenter do
  
  subject { PostsPresenter }
  let(:model) { Post }

  it_behaves_like "index presenter"

end
