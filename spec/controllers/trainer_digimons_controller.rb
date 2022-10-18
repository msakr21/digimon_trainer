require 'rails_helper'

RSpec.describe TrainerDigimonsController, type: :controller do
  it "returns params with specified hash for create method" do
    params = {
        "name" => "Devi",
        "kind" => "Devimon",
        "starter" => false,
        "wins" => 6
    }
  
    should permit(:name, :age, :starter, :wins).for(:create, params: params)
  end
end