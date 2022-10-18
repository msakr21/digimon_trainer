require 'rails_helper'

RSpec.describe 'Trainers Digimons new' do
  before :each do
    @trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    @trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    @digimon = @trainer.digimons.create!(name: "Agu", kind: "Agumon", starter: true, wins: 9)
    @digimon_3 = @trainer_2.digimons.create!(name: "Potato", kind: "Patamon", starter: false, wins: 9)
  end
  
  it "displays a fillable form" do
    visit "/trainers/#{@trainer.id}/digimons/new"

    expect(page).to have_content("New Digimon Submission Form")
    expect(page).to have_content("Name")
    expect(page).to have_content("Kind")
    expect(page).to have_content("Starter?")
    expect(page).to have_content("Wins")
    expect(page).to have_selector(:css, 'form')
  end
end

