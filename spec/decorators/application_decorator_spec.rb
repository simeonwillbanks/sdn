# encoding: utf-8
require 'spec_helper'

describe ApplicationDecorator do
  before { ApplicationController.new.set_current_view_context }

  describe '#heading' do
    let(:moment) { BeerDecorator.decorate(Factory.create(:beer)) }
    context 'index view' do
      it 'should be a link to moment' do
        moment.heading.should == "<a href=\"/beers/#{moment.id}\">#{moment.name}</a>"
      end
    end
    context 'show view' do
      it 'should be text' do
        moment.stub(:h).and_return(double(:current_page? => true))
        moment.heading.should == moment.name
      end
    end
  end
end
