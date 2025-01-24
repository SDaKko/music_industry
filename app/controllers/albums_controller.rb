class AlbumsController < ApplicationController
  before_action :set_artist
  before_action :set_album, only: %i[ show edit update confirm_destroy destroy ]

  def index
    @albums = @artist.albums.all
  end

  def show
  end

  def new
    @album = @artist.albums.build
  end

  def edit
  end

  def create
    @album = @artist.albums.build(album_params)

    if @album.save
      redirect_to artist_album_url(@artist, @album)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @album.update(album_params)
      redirect_to artist_album_url(@artist, @album)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @album.destroy
    redirect_to artist_albums_path
  end

  private
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def set_album
      @album = @artist.albums.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:title, :record_label, :album_genre, :number_of_tracks)
    end
end