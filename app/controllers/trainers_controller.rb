class TrainersController < ApplicationController

  def index
    @trainers = Trainer.order_by_created_at

    if params[:sort].present? || params[:sort] == true
      @trainers = Trainer.group_by_count

      @display_count = true
    end
  end

  def show
    @trainer = Trainer.find(params[:id])
  end

  def new
  end

  def create
    trainer = Trainer.new(trainer_params)

    trainer.save
    redirect_to '/trainers'
  end

  def edit
    @trainer = Trainer.find(params[:trainer_id])

    
  end

  def update
    trainer = Trainer.find(params[:id])
    trainer.update(trainer_params)
    trainer.save
    redirect_to "/trainers/#{trainer.id}"
  end

  def destroy
    Trainer.destroy(params[:id])
    redirect_to "/trainers"
  end


private
  def trainer_params
    params.permit(:name, :age, :tutorial_completed)
  end
end