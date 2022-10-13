class TrainerDigimonsController < ApplicationController
  def index
    @trainer = Trainer.find(params[:trainer_id])
    @digimons = @trainer.digimons.all
  end

  # def show
  #   # binding.pry;binding.pry
  #   @digimon = @trainer.digimons.find(params[:id])
  # end
end