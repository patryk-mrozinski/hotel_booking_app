class HotelsController < ApplicationController

  def index
    if Hotel.filter(params).empty?
      @hotels = Hotel.all
    else
      @hotels = Hotel.filter(params)
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
  end
end
