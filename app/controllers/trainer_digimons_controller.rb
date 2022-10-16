class TrainerDigimonsController < ApplicationController
  def index
    @trainer = Trainer.find(params[:trainer_id])
    @digimons = @trainer.digimons.all
  end

  def new
    @trainer = Trainer.find(params[:trainer_id])
    # require 'pry'; binding.pry
  end
  
  def create
    # require 'pry';binding.pry
    trainer = Trainer.find(params[:trainer_id])
    digimon = trainer.digimons.new({name: params[:digimon][:name], age: params[:digimon][:kind], starter: params[:digimon][:starter], name: params[:digimon][:wins]})

    digimon.save
    redirect_to "/trainers/#{trainer.id}/digimons"
  end
end