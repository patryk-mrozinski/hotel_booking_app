class RoomsController < ApplicationController
  def index
    @rooms = Room.filter(filter_params)
  end

  def show
    @room = Room.find(params[:id])
  end

  private

  def filter_params
    params.slice(*Hotel.search_scopes)
  end
  
end
