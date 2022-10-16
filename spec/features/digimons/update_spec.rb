require 'rails_helper'

RSpec.describe 'the update digimon feature' do
  before :each do
    @trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    @trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    @digimon = @trainer.digimons.create!(name: "Agu", kind: "Agumon", starter: true, wins: 9)
    @digimon_2 = @trainer.digimons.create!(name: "Gabu", kind: "Gabumon", starter: false, wins: 7)
    @digimon_3 = @trainer_2.digimons.create!(name: "Potato", kind: "Patamon", starter: false, wins: 9)
  end

  it "updates an entry in the database upon clicking submit" do
    visit "/digimons/#{@digimon.id}/edit"

    fill_in "digimon[name]", with: "NOT Agu"
    fill_in "digimon[kind]", with: "ToyAgumon"
    choose "false"
    fill_in "digimon[wins]", with: 12
    
    click_on "Submit"

    expect(page.current_path).to eql("/digimons/#{@digimon.id}")
    expect(page).to have_content("NOT Agu")
  end
end