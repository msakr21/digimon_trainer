class TrainersController < ApplicationController

  def index
    @trainers = Trainer.all.order(created_at: :desc)
  end

  def show
    @trainer = Trainer.find(params[:id])
  end

  def new
    # require 'pry'; binding.pry
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
end