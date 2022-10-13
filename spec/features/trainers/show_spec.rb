require 'rails_helper'

RSpec.describe 'the trainers show page' do
  it "displays the trainer name" do
    @trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    @trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    visit "/trainers/#{trainer.id}"
    @digimon = @trainer.digimons.create!(name: "Agu", kind: "Agumon", starter: true, wins: 9)
    @digimon_2 = @trainer.digimons.create!(name: "Gabu", kind: "Gabumon", starter: false, wins: 7)
    @digimon_3 = @trainer_2.digimons.create!(name: "Potato", kind: "Patamon", starter: false, wins: 9)

    expect(page).to have_content(@trainer.name)
    expect(page).to_not have_content(@trainer_2.name)
    expect(page).to have_content(@trainer.digimons_count)
  end
end


#Why does it have to be @ for test to work!?