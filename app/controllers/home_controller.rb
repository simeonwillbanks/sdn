class HomeController < ApplicationController
  expose(:moments) { HomePresenter.new(Moment.all) }
end
