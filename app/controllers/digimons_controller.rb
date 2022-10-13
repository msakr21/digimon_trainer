class DigimonsController < ApplicationController
  def index
    @digimons = Digimon.all
  end

  def show
    @digimon = Digimon.find(params[:id])
  end
end