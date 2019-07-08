class HotelsController < ApplicationController

  def index
    @hotels = Hotel.filter(filter_params)
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  private

  def filter_params
    params.slice(*Hotel.search_scopes)
  end
end
