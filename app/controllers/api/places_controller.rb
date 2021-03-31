class Api::PlacesController < ApplicationController
  def index
    @places = Place.all
    render "index.json.jb"
  end

  def show
    id = params[:id]
    @places = Place.find(id)
    render "show.json.jb"
  end

  def create
    @places = Place.new(
      name: params[:name],
      address: params[:address],
    )
    if @places.save
      render "show.json.jb"
    else
      render json: { errors: @places.error.full_messages },
             status: 406
    end
  end

  def update
    id = params[:id]
    @places = Place.find(id)
    @places.name = params[:name] || places.name
    @places.address = params[:address] || places.address
    if @places.save
      render "show.json.jb"
    else
      render json: { errors: @places.error.full_messages }, status: 406
    end
  end

  def destroy
    places = Place.find_by(id: params[:id])
    movies.destroy
    render json: { message: "Listing deleted" }
  end
end
