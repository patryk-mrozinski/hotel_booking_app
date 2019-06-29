class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
  end

  def show; end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.create(hotel_params)

    if @hotel.save
      redirect_to @hotel
    else
      render :new
    end
  end

  def edit; end

  def update
    if @hotel.update(hotel_params)
      redirect_to @hotel
    else
      render :edit
    end
  end

  def destroy
    @hotel.destroy
    redirect_to hotels_path
end
