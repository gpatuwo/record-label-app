class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to albums_url(@album.id)
    else
      flash.now[:errors] = "Something's wrong with the album info"
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  private
  def album_params
    params.require(:user).permit(:title, :band_id, :year, :live)
  end
end
