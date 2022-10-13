class TrainersController < ApplicationController

  def index
    @trainers = Trainer.all
  end

  def show
    # require 'pry';binding.pry
    @trainer = Trainer.find(params[:id])
  end

end