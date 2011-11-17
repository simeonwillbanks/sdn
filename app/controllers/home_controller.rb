class HomeController < ApplicationController
  expose(:moments) { HomePresenter.new(MomentsPresenter.index(params)) }
end
