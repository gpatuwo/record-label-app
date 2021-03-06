class TracksController < ApplicationController
  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to tracks_url(@track.id)
    else
      flash.now[:error] = "Merp. Something's wrong with your info"
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  private
  def track_params
    params.require(:track).permit(:title, :album_id, :ord, :bonus, :lyrics)
  end
end
