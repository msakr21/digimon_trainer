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

  def update
    digimon = Digimon.find(params[:id])
    digimon.update({name: params[:digimon][:name], kind: params[:digimon][:kind], starter: params[:digimon][:starter], wins: params[:digimon][:wins]})
    digimon.save
    redirect_to "/digimons/#{digimon.id}"
  end

  def destroy
    Digimon.destroy(params[:id])
    redirect_to "/digimons"
  end
end