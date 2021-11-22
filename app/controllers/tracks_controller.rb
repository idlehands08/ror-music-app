class TracksController < ApplicationController
  before_action :set_track, only: %i[ show edit update destroy ]

  def index
    @tracks = Track.all
  end

  def show
  end

  def new
    @track = Track.new
  end

  def edit
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to @track, notice: "Track was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    if @track.update(track_params)
      redirect_to @track, notice: "Track was successfully updated." 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @track.destroy
      redirect_to tracks_url, notice: "Track was successfully destroyed." 
  end

  private
    def set_track
      @track = Track.find(params[:id])
    end

    def track_params
      params.require(:track).permit(:name, :url, :credits, :length, :available)
    end
end
