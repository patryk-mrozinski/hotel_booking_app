class HotelsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_hotel, only: %i(show show_hotel edit update destroy)

  layout 'for_companies', except: %i(index show)

  def index
    @hotels = Hotel.all
  end

  def show; end

  def index_hotels
    @hotels = current_user.hotels
    @hotel = current_user.hotels.build
  end

  def show_hotel; end

  def new
    @hotel = current_user.hotels.build
  end

  def create
    @hotel = current_user.hotels.build(hotel_params)

    if @hotel.save
      redirect_to [:for_company, @hotel]
    else
      render :new
    end
  end

  def edit; end

  def update
    if @hotel.update(hotel_params)
      redirect_to [:for_company, @hotel]
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
