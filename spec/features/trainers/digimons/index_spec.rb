require 'rails_helper'

RSpec.describe 'Trainers Digimons index' do
  before :each do
    @trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    @trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    @digimon_2 = @trainer.digimons.create!(name: "Gabu", kind: "Gabumon", starter: false, wins: 7)
    @digimon = @trainer.digimons.create!(name: "Agu", kind: "Agumon", starter: true, wins: 9)
    @digimon_3 = @trainer_2.digimons.create!(name: "Potato", kind: "Patamon", starter: false, wins: 9)
  end

  it ' shows all of the names of the digimons for a trainer' do
    visit "/trainers/#{@trainer.id}/digimons"

    expect(page).to have_content(@digimon.name)
    expect(page).to have_content(@digimon_2.name)
    expect(page).to have_content(@digimon.kind)
    expect(page).to have_content(@digimon.starter)
    expect(page).to have_content(@digimon.wins)
    expect(page).to_not have_content(@digimon_3.name)
  end

  it "has a link that redirects to '/trainers/@trainer.id/digimons/new'" do
    visit "/trainers/#{@trainer.id}/digimons"

    expect(page).to have_selector(:css, "a[href='/trainers/#{@trainer.id}/digimons/new']")
  end

  it "has a button to list digimons in alphabitcal order" do
    visit "/trainers/#{@trainer.id}/digimons"

    expect(page).to have_link("Sort Alphabatically")
  end

  it "sorts the digimon in the trainer/digimon index page in alphabatical order" do
    visit "/trainers/#{@trainer.id}/digimons"
    expect("Gabu").to appear_before("Agu")
    
    click_on "Sort Alphabatically"

    expect(current_path).to eq("/trainers/#{@trainer.id}/digimons")
    expect("Agu").to appear_before("Gabu", only_text: true)
  end

  it "has a button to list digimons in alphabitcal order" do
    visit "/trainers/#{@trainer.id}/digimons"
    save_and_open_page
    expect(page).to have_field("Filter by wins:")
    expect(page).to have_button("Only return records with more wins")
  end

  xit "sorts the digimon in the trainer/digimon index page in alphabatical order" do
    visit "/trainers/#{@trainer.id}/digimons"
    expect("Gabu").to appear_before("Agu")
    
    fill_in "wins"

    expect(current_path).to eq("/trainers/#{@trainer.id}/digimons")
    expect("Agu").to appear_before("Gabu", only_text: true)
  end
end


