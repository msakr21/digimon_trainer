class TrainerDigimonsController < ApplicationController
  def index
    @trainer = Trainer.find(params[:trainer_id])
    @digimons = @trainer.digimons.order(params[:sort])
  end

  def new
    @trainer = Trainer.find(params[:trainer_id])
  end
  
  def create
    trainer = Trainer.find(params[:trainer_id])
    digimon = trainer.digimons.new(digimon_params)

    digimon.save
    redirect_to "/trainers/#{trainer.id}/digimons"
  end

private
  def digimon_params
    params.permit(:name, :kind, :starter, :wins)
  end
end