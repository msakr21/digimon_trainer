require 'rails_helper'

RSpec.describe 'update' do
  before :each do
    @trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    @trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    @digimon = @trainer.digimons.create!(name: "Agu", kind: "Agumon", starter: true, wins: 9)
    @digimon_2 = @trainer.digimons.create!(name: "Gabu", kind: "Gabumon", starter: false, wins: 7)
    @digimon_3 = @trainer_2.digimons.create!(name: "Potato", kind: "Patamon", starter: false, wins: 9)
  end

  it "updates an entry in the database upon clicking submit" do
    visit "/trainers/#{@trainer.id}/edit"

    fill_in "name", with: "NOT Jessey"
    fill_in "age", with: "201"
    choose "True"
    
    click_on "Update Trainer"

    expect(page.current_path).to eql("/trainers/#{@trainer.id}")
    expect(page).to have_content("NOT Jessey")
  end
end