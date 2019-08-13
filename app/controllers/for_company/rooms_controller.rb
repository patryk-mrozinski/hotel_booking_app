module ForCompany
  class RoomsController < BaseController
    before_action :authenticate_user!
    before_action :set_room, only: %i[show edit update destroy]

    def index
      @hotel = Hotel.find(params[:hotel_id])
      @rooms = @hotel.rooms
    end

    def show; end

    def new
      @room = Room.new
    end

    def create
      @room = Room.new(room_params)

      if @room.save
        redirect_to [:for_company, @room.hotel]
      else
        render :new
      end
    end

    def edit; end

    def update
      if @room.update(room_params)
        redirect_to [:for_company, @room]
      else
        render :edit
      end
    end

    def destroy
      @hotel = @room.hotel

      @room.destroy
      redirect_to [:for_company, @hotel]
    end

    private

    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name, :price, :description, :available_from, :available_to,
                                   :number_of_guests, :hotel_id, images: [])
    end
  end
end
