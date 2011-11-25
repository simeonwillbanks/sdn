class HomeController < ApplicationController
  expose(:moments) { HomePresenter.new params[:page] }
end
