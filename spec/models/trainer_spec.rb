require 'rails_helper'

RSpec.describe Trainer, type: :model do
  it {should have_many :digimons}

  describe 'instance methods' do
    it 'counts number of digimon per trainer' do
      trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
      trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
      digimon = trainer.digimons.create!(name: "Agu", kind: "Agumon", starter: true, wins: 9)
      digimon_2 = trainer.digimons.create!(name: "Gabu", kind: "Gabumon", starter: false, wins: 7)
      digimon_3 = trainer_2.digimons.create!(name: "Potato", kind: "Patamon", starter: false, wins: 9)

      expect(trainer.digimons_count).to eq(2)
      expect(trainer_2.digimons_count).to eq(1)
    end
  end
end