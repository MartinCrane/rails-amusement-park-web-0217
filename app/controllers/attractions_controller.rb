class AttractionsController < ApplicationController
  def create

    # @attraction = Attraction.find(params[:id])
    @attraction = Attraction.create(attraction_params)

    redirect_to @attraction
  end

  def new
    @attraction = Attraction.new
  end

  def show
    @user = current_user
    @attraction = Attraction.find(params[:id])
  end

  def index
    @user = current_user
    @attractions = Attraction.all
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    attraction = Attraction.find(params[:id])
    attraction.update(attraction_params)
    redirect_to attraction
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
