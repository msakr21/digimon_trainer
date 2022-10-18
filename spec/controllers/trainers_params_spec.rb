require 'rails_helper'

RSpec.describe TrainersController, type: :controller do
  it "returns params with specified hash for create method" do
    params = {
        "name" => "Ahmed",
        "age" =>  9,
        "tutorial_completed" => false,
    }
   
    should permit(:name, :age, :tutorial_completed).for(:create, params: params)
  end

  it "returns params with specified hash for update method" do  
    trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)

    params = {
      id: trainer.id, 
      "name" => "Ahmed",
      "age" =>  9,
      "tutorial_completed" => false,
    }

    should permit(:name, :age, :tutorial_completed).for(:update, params: params)
  end
end
