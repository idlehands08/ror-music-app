class ArtistsController < ApplicationController
    before_action :set_artist, only: %i[ show edit update destroy ]
  
    def index
      @artists = Artist.all
    end
  
    def new
      @artist = Artist.new
    end
  
    def edit
    end
  
    def create
      @artist = Artist.new(artist_params)
  
      respond_to do |format|
        if @artist.save
         redirect_to @artist, notice: "Artist was successfully created."
        else
           render :new, status: :unprocessable_entity 
        end
      end
    end
  
    def update
      respond_to do |format|
        if @artist.update(artist_params)
          redirect_to @artist, notice: "Artist was successfully updated." 
        else
          render :edit, status: :unprocessable_entity 
        end
      end
    end
  
    def destroy
      @artist.destroy
      respond_to do |format|
        redirect_to artists_url, notice: "Artist was successfully destroyed." 
      end
    end
  
    private
      def set_artist
        @artist = Artist.find(params[:id])
      end
  
      def artist_params
        params.require(:artist).permit(:name, :permalink, :bio, :formed_at, :verified, :verified_at, :avatar_url, :cover_photo_url)
      end
  end
  