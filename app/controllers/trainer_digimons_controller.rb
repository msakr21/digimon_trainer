class TrainerDigimonsController < ApplicationController
  def index
    @trainer = Trainer.find(params[:trainer_id])
    @digimons = @trainer.digimons.all
  end
end