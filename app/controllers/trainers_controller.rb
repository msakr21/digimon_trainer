class TrainersController < ApplicationController

  def index
    @trainers = Trainer.all.order(created_at: :desc)
  end

  def show
    @trainer = Trainer.find(params[:id])
  end

end