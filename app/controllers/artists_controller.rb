class ArtistsController < ApplicationController
  def index
  end

  def show
      @artist = Artist.includes(:assets).find(params[:id])
  end
end
