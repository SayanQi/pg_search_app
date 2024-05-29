class CarParksController < ApplicationController
  def index
    if( params[:q].present?)
      @car_parks = CarPark.search_by_details(params[:q].to_s)
    else
      @car_parks = CarPark.all
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
