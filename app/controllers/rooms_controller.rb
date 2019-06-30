class RoomsController < ApplicationController
  before_action :authenticate_user!, expect: %i(index show)
  before_action :set_room, only: %i(show edit update destroy)

  def index
    @rooms = Room.all
  end

  def show; end

  def new
    @room = current_user.rooms.new
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      redirect_to @room
    else
      render :new
    end
  end

  def edit; end

  def update
    if @room.update(room_params)
      redirect_to @room
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_path
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :price, :description, :picture, :available_from, :available_to, hotel_ids: [])
  end
end
