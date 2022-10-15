require 'rails_helper'

RSpec.describe 'the trainers show page' do
  it "displays a trainer's information" do
    trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    digimon = trainer.digimons.create!(name: "Agu", kind: "Agumon", starter: true, wins: 9)
    digimon_2 = trainer.digimons.create!(name: "Gabu", kind: "Gabumon", starter: false, wins: 7)
    digimon_3 = trainer_2.digimons.create!(name: "Potato", kind: "Patamon", starter: false, wins: 9)
    visit "/trainers/#{trainer.id}"

    expect(page).to have_content(trainer.name)
    expect(page).to have_content(trainer.age)
    expect(page).to have_content(trainer.tutorial_completed)
    expect(page).to_not have_content(trainer_2.name)
  end

  it "displays how many digimons a trainer has" do
    trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    digimon = trainer.digimons.create!(name: "Agu", kind: "Agumon", starter: true, wins: 9)
    digimon_2 = trainer.digimons.create!(name: "Gabu", kind: "Gabumon", starter: false, wins: 7)
    digimon_3 = trainer_2.digimons.create!(name: "Potato", kind: "Patamon", starter: false, wins: 9)
    visit "/trainers/#{trainer.id}"

    expect(page).to have_content(trainer.digimons_count)
  end
end