class BandsController < ApplicationController

  def new

  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band.id)
    else
      flash.now[:errors] = "Uh oh. Something isn't right. Try again"
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def index
    @bands = Band.all
    render :index
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
