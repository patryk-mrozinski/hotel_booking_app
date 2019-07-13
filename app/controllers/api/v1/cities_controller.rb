module Api
  module V1
    class CitiesController < ApplicationController
      def index
        @country = Country.find(params[:country_id])
        @cities = @country.cities
        render json: @cities
      end
    end
  end
end
