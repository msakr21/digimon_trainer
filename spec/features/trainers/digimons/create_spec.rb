require 'rails_helper'

RSpec.describe 'Trainers Digimons new' do
  before :each do
    @trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    @trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    @digimon = @trainer.digimons.create!(name: "Agu", kind: "Agumon", starter: true, wins: 9)
    @digimon_3 = @trainer_2.digimons.create!(name: "Potato", kind: "Patamon", starter: false, wins: 9)
  end

  it "creates a new entry in the database upon clicking submit" do
    visit "/trainers/#{@trainer.id}/digimons/new"

    fill_in "digimon[name]", with: "Gabu"
    fill_in "digimon[kind]", with: "Gabumon"
    choose "false"
    fill_in "digimon[wins]", with: 7
    
    click_on "Create Digimon"

    expect(page.current_path).to eql("/trainers/#{@trainer.id}/digimons")
    expect(page).to have_content("Gabu")
  end
end