require 'rails_helper'

RSpec.describe 'the edit trainer page' do
  before :each do
    @trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    @trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    @digimon = @trainer.digimons.create!(name: "Agu", kind: "Agumon", starter: true, wins: 9)
    @digimon_2 = @trainer.digimons.create!(name: "Gabu", kind: "Gabumon", starter: false, wins: 7)
    @digimon_3 = @trainer_2.digimons.create!(name: "Potato", kind: "Patamon", starter: false, wins: 9)
  end

  it "displays a filled form" do
    visit "/trainers/#{@trainer.id}/edit"

    expect(page).to have_content("Name:")
    expect(page).to have_field("name", with: "#{@trainer.name}")
    expect(page).to have_content("Age:")
    expect(page).to have_field("age", with: "#{@trainer.age}")
    expect(page).to have_content("Tutorial Completed?")
    expect(page).to have_checked_field("false")
    expect(page).to have_selector(:css, "form")
  end
end