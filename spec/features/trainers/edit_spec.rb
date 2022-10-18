require 'rails_helper'

RSpec.describe 'the edit trainer page' do
  before :each do
    @trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: true)
    @trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    @digimon = @trainer.digimons.create!(name: "Agu", kind: "Agumon", starter: true, wins: 9)
    @digimon_2 = @trainer.digimons.create!(name: "Gabu", kind: "Gabumon", starter: false, wins: 7)
    @digimon_3 = @trainer_2.digimons.create!(name: "Potato", kind: "Patamon", starter: false, wins: 9)
  end

  it "displays a filled form" do
    visit "/trainers/#{@trainer.id}/edit"

    expect(page).to have_content("Name")
    expect(page).to have_field("name", with: "#{@trainer.name}")
    expect(page).to have_content("Age")
    expect(page).to have_field("age", with: "#{@trainer.age}")
    expect(page).to have_content("Tutorial completed?")
    expect(page).to have_content("False")
    expect(page).to have_content("True")
    expect(find_field("True")).to be_checked
    expect(page).to have_selector(:css, "form")

    visit "/trainers/#{@trainer_2.id}/edit"
    expect(find_field("False")).to be_checked
  end
end