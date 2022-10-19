class TrainerDigimonsController < ApplicationController
  def index
    @trainer = Trainer.find(params[:trainer_id])
    digimon_list
  end

  def digimon_list
    # binding.pry
    if params[:min_wins].present?
      @digimons = @trainer.digimons.filter_by_wins(params[:min_wins].to_i)
    elsif params[:sort].present?
      @digimons = @trainer.order_digimons_by(params[:sort])
    else
      @digimons = @trainer.digimons
    end
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