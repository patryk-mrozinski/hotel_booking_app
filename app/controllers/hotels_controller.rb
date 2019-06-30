class HotelsController < ApplicationController
  # before_action :authenticate_user!, expect: %i(index show)
  before_action :set_hotel, only: %i(show edit update destroy)

  def index
    @hotels = Hotel.all
  end

  def show; end

  def new
    @hotel = current_user.hotels.new
  end

  def create
    @hotel = current_user.hotels.build(hotel_params)

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

  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  def hotel_params
    params.require(:hotel).permit(:name, :stars, :description, user_ids: [], city_ids: [])
  end
end
