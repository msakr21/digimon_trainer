class DigimonsController < ApplicationController
  def index
    @digimons = Digimon.all
  end

  def show
    # binding.pry;binding.pry
    @digimon = Digimon.find(params[:id])
  end
end