class RoomsController < ApplicationController
  def index
    @rooms = Room.filter(filter_params)
  end

  def show
    @room = Room.find(params[:id])
    @reservation = @room.reservations.build
  end

  private

  def filter_params
    params.slice(*Room.search_scopes)
  end
end
