class TravelsController < ApplicationController
  expose(:dopplr) do
    OpenStruct.new(
      title: 'Where Simeon has been',
      profile:'http://www.dopplr.com/traveller/simeonsdotnet/',
      raumzeitgeist: 'http://www.dopplr.com/traveller/simeonsdotnet/raumzeitgeist_jpeg?7988'
    )
  end
end
