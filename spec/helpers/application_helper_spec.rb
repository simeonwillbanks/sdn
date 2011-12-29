# encoding: utf-8
require 'spec_helper'

describe ApplicationHelper do

  describe '.nav_item' do
    context 'when called by Home controller view' do
      before (:each) do
        helper.stub(:controller).and_return(double(:controller_name => 'home'))
      end
      it 'sets Home navigation item to active' do
        helper.nav_item('home').should == '<li class="active"><a href="/">Home</a></li>'
      end
      it 'does not set Posts navigation item to active' do
        helper.nav_item('posts').should == '<li><a href="/posts">Posts</a></li>'
      end
    end
    context 'when called by Posts controller view' do
      before (:each) do
        helper.stub(:controller).and_return(double(:controller_name => 'posts'))
      end
      it 'sets Posts navigation item to active' do
        helper.nav_item('posts').should == '<li class="active"><a href="/posts">Posts</a></li>'
      end
      it 'does not set Home navigation item to active' do
        helper.nav_item('home').should == '<li><a href="/">Home</a></li>'
      end
    end
  end

  describe '.flash_messages' do
    context 'one flash message is set' do
      before(:each) do
        helper.stub(:flash).and_return({:notice=>'You did something right'})
      end
      it 'shows a single message' do
        helper.flash_messages.scan(/<div/).size.should == 1
      end
      it 'with one success message' do
        helper.flash_messages.scan(/alert alert\-success/).size.should == 1
      end
    end
    context 'multiple flash messages are set' do
      before(:each) do
        helper.stub(:flash).and_return({
          :alert=>'You did something wrong',
          :notice=>'You did something right'})
      end
      it 'shows a multiples messages' do
        helper.flash_messages.scan(/<div/).size.should == 2
      end
      it 'with bootstrap selectors set' do
        helper.flash_messages.scan(/alert alert\-/).size.should == 2
      end
      it 'has one success message' do
        helper.flash_messages.scan(/alert alert\-success/).size.should == 1
      end
      it 'has one error message' do
        helper.flash_messages.scan(/alert alert\-error/).size.should == 1
      end
    end
  end
end
