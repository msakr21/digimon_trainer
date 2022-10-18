require 'rails_helper'

RSpec.describe DigimonsController, type: :controller do
  it "returns params with specified hash for update method" do  
    trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    digimon = trainer.digimons.create!(name: "Devi", kind: "Devimon", starter: false, wins: 6)
    params = {id: digimon.id, 
              "name" => "Devi",
              "kind" => "Devimon",
              "starter" => false,
              "wins" => 6
              }

    should permit(:name, :kind, :starter, :wins).for(:update, params: params)
  end
end