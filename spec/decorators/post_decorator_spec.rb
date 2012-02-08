# encoding: utf-8
require 'spec_helper'

describe PostDecorator do
  before { ApplicationController.new.set_current_view_context }

  describe '#body' do
    let(:original) { Factory.build(:post, :body => Forgery(:lorem_ipsum).paragraphs(8)) }
    let(:posting) { PostDecorator.decorate(original) }
    context 'index action' do
      it 'should be no longer than 300 characters' do
        posting.h.stub(:current_page?).and_return(false)
        posting.body.length.should == 300
      end
    end
    context 'show action' do
      it 'should display full body' do
        posting.h.stub(:current_page?).and_return(true)
        original.body.should == posting.body
      end
    end
  end
end
