class TrainerDigimonsController < ApplicationController
  def index
    @trainer = Trainer.find(params[:trainer_id])
    @digimons = @trainer.digimons.all
  end

  def new
    @trainer = Trainer.find(params[:trainer_id])
  end
  
  def create
    trainer = Trainer.find(params[:trainer_id])
    digimon = trainer.digimons.new({name: params[:digimon][:name], kind: params[:digimon][:kind], starter: params[:digimon][:starter], wins: params[:digimon][:wins]})

    digimon.save
    redirect_to "/trainers/#{trainer.id}/digimons"
  end
end