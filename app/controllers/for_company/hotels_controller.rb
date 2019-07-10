module ForCompany
  class HotelsController < BaseController
    before_action :authenticate_user!
    before_action :set_hotel, only: %i(show edit update destroy)

    def index
      @company = Company.find(params[:company_id])
      @hotels = @company.hotels
    end

    def show; end

    def new
      @hotel = Hotel.new
    end

    def create
      @hotel = Hotel.new(hotel_params)

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
      params.require(:hotel).permit(:name, :stars, :description, :company_id, :country_id, :city_id)
    end
  end
end
