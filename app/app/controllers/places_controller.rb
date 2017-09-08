class PlacesController < ApplicationController

  def index
    @places = Place.all

    puts @places.first.coords

    puts RGeo::GeoJSON.encode(@places.first.coords)

    @places.map { |k,v| k.coords = RGeo::GeoJSON.encode(k.coords, json_parser: :json) }
    #puts

    #parser = RGeo::WKRep::WKTParser.new(nil, :support_ewkt => true)


    #render json: RGeo::GeoJSON.decode(@places.to_json, json_parser: :json)
    #render json: Place.geo_factory.parse_wkt(@places)
    render json: @places.to_json

  end

  def create

    coords = Place.geo_factory.point(50.324192, 19.037805)

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
