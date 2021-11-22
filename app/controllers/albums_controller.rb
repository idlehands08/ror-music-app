class AlbumsController < ApplicationController
  before_action :set_album, only: %i[ show edit update destroy ]

  def index
    @albums = Album.all
  end

  def show
  end

  def new
    @album = Album.new
  end

  def edit
  end

  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        redirect_to @album, notice: "Album was successfully created." 
      else
        render :new, status: :unprocessable_entity 
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update(album_params)
        redirect_to @album, notice: "Album was successfully updated." 
      else
        render :edit, status: :unprocessable_entity 
      end
    end
  end

  def destroy
    @album.destroy
    respond_to do |format|
      redirect_to albums_url, notice: "Album was successfully destroyed." 
    end
  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:name, :released, :released_at, :cover_art_url, :length, :kind)
    end
end
