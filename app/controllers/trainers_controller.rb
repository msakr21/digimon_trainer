class TrainersController < ApplicationController

  def index
    @trainers = Trainer.order_by_created_at
  end

  def show
    @trainer = Trainer.find(params[:id])
  end

  def new
  end

  def create
    trainer = Trainer.new({name: params[:trainer][:name], age: params[:trainer][:age],tutorial_completed: params[:trainer][:tutorial_completed]})

    trainer.save
    redirect_to '/trainers'
  end

  def edit
    @trainer = Trainer.find(params[:trainer_id])
  end

  def update
    trainer = Trainer.find(params[:id])
    trainer.update({name: params[:trainer][:name], age: params[:trainer][:age],tutorial_completed: params[:trainer][:tutorial_completed]})
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