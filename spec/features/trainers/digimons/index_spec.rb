require 'rails_helper'

RSpec.describe 'Trainers Digimons index' do
  before :each do
    @trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    @trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    @digimon = @trainer.digimons.create!(name: "Agu", kind: "Agumon", starter: true, wins: 9)
    @digimon_2 = @trainer.digimons.create!(name: "Gabu", kind: "Gabumon", starter: false, wins: 7)
    @digimon_3 = @trainer_2.digimons.create!(name: "Potato", kind: "Patamon", starter: false, wins: 9)
  end

  it ' shows all of the names of the digimons for a trainer' do
    visit "/trainers/#{@trainer.id}/digimons"

    expect(page).to have_content(@digimon.name)
    expect(page).to have_content(@digimon_2.name)
    expect(page).to_not have_content(@digimon.kind)
    expect(page).to_not have_content(@digimon.starter)
    expect(page).to_not have_content(@digimon.wins)
    expect(page).to_not have_content(@digimon_3.name)
  end

  it "links to each digimon" do
    visit "/trainers/#{@trainer.id}/digimons"

    click_on @digimon.name 
    #Capybara method

    expect(current_path).to eq("/digimons/#{@digimon.id}")
    #another Capybara method
  end

  it "has a link that redirects to '/trainers/@trainer.id/digimons/new'" do
    visit "/trainers/#{@trainer.id}/digimons"

    expect(page).to have_selector(:css, "a[href='/trainers/#{@trainer.id}/digimons/new']")
  end
end


