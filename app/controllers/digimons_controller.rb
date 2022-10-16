class DigimonsController < ApplicationController
  def index
    @digimons = Digimon.all
  end

  def show
    @digimon = Digimon.find(params[:id])
  end

  def edit
    @digimon = Digimon.find(params[:digimon_id])
  end
end