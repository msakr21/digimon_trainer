require 'rails_helper'

RSpec.describe 'the edit digimon page' do
  before :each do
    @trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    @trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: true)
    @digimon = @trainer.digimons.create!(name: "Agu", kind: "Agumon", starter: true, wins: 9)
    @digimon_2 = @trainer.digimons.create!(name: "Gabu", kind: "Gabumon", starter: false, wins: 7)
    @digimon_3 = @trainer_2.digimons.create!(name: "Potato", kind: "Patamon", starter: false, wins: 9)
  end

  it "displays a filled form" do
    visit "/digimons/#{@digimon.id}/edit"

    expect(page).to have_content("Name")
    expect(page).to have_field("name", with: "#{@digimon.name}")
    expect(page).to have_content("Kind")
    expect(page).to have_field("kind", with: "#{@digimon.kind}")
    expect(page).to have_content("Starter?")
    expect(page).to have_content("True")
    expect(page).to have_content("False")
    expect(page).to have_content("Wins")
    expect(page).to have_field("wins", with: "#{@digimon.wins}")
    expect(find_field("True")).to be_checked
    expect(page).to have_selector(:css, "form")

    visit "/digimons/#{@digimon_2.id}/edit"

    expect(find_field("False")).to be_checked
  end
end