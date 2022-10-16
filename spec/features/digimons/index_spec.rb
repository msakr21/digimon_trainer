require 'rails_helper'

RSpec.describe 'the digimons index page' do
  before :each do
    @trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    @digimon = @trainer.digimons.create!(name: "Agu", kind: "Agumon", starter: true, wins: 9)
    @digimon_2 = @trainer.digimons.create!(name: "Gagu", kind: "Gabumon", starter: false, wins: 7)
  end

  xit "displays a list of digimons" do
    visit "/digimons"

    expect(page).to have_content(@digimon.name)
    expect(page).to have_content(@digimon.kind)
    expect(page).to have_content(@digimon.starter)
    expect(page).to have_content(@digimon.wins)
    expect(page).to have_content(@trainer.name)
    expect(page).to have_content(@digimon_2.name)
    expect(page).to have_content(@digimon.created_at)
    expect(page).to have_content(@digimon.updated_at)
  end

  it "only displays digimons who are starters" do
    visit "/digimons"

    expect(page).to have_content(@digimon.name)
    expect(page).to have_content(@digimon.kind)
    expect(page).to have_content(@digimon.starter)
    expect(page).to have_content(@digimon.wins)
    expect(page).to have_content(@trainer.name)
    expect(page).to_not have_content(@digimon_2.name)
    expect(page).to have_content(@digimon.created_at)
    expect(page).to have_content(@digimon.updated_at)
  end
end