class MomentsController < ApplicationController
  before_filter :authenticate_admin!

  def create
    moment = Moment.new
    moment.save
    redirect_to root_path, :notice => "Moment successfully created"
  end

end
