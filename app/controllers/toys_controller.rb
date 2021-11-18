class ToysController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @toys = policy_scope(Toy)
  end

  def show
    #@toy = Toy.find(params[:id])
    set_toy
    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def new
    @toy = Toy.new
    authorize @toy
  end

  def create
    @toy = Toy.new(toy_params)
    if @toy.save
      redirect_to toy_path(@toy)
    else
      render :new
    end
  end

  private

  def set_toy
    @toy = Toy.find(params[:id])
    authorize @toy
  end

  def toy_params
    params.require(:toys).permit(:name, :description, :condition, :category)
  end
end
