class PlacesController < ApplicationController

  def index

    @places = Place.all

    render json: @places.to_json

  end

  def create

    coords = Place.geo_factory.point(params.require(:place)[:lat], params.require(:place)[:lng])

    @place = Place.new(place_params)
    @place.coords = coords

    if @place.save!
      render json: {
        status: 200,
        message: "Created"
      }.to_json
    else
      render json: {
        status: 500,
        message: "Error"
      }.to_json
    end
  end

  private

    def place_params
      params.require(:place).permit(:name)
    end

end
