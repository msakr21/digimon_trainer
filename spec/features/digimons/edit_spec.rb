require 'rails_helper'

RSpec.describe 'the edit digimon page' do
  before :each do
    @trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    @trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    @digimon = @trainer.digimons.create!(name: "Agu", kind: "Agumon", starter: true, wins: 9)
    @digimon_2 = @trainer.digimons.create!(name: "Gabu", kind: "Gabumon", starter: false, wins: 7)
    @digimon_3 = @trainer_2.digimons.create!(name: "Potato", kind: "Patamon", starter: false, wins: 9)
  end

  it "displays a filled form" do
    visit "/digimons/#{@digimon.id}/edit"

    expect(page).to have_content("Name:")
    expect(page).to have_field("digimon[name]", with: "#{@digimon.name}")
    expect(page).to have_content("Kind:")
    expect(page).to have_field("digimon[kind]", with: "#{@digimon.kind}")
    expect(page).to have_content("Starter?")
    expect(page).to have_checked_field("true")
    expect(page).to have_content("Wins:")
    expect(page).to have_field("digimon[wins]", with: "#{@digimon.wins}")
    expect(page).to have_selector(:css, "form")
  end

  xit "updates an entry in the database upon clicking submit" do
    visit "/trainers/#{@trainer.id}/edit"

    fill_in "trainer[name]", with: "NOT Jessey"
    fill_in "trainer[age]", with: "201"
    choose "true"
    
    click_on "Submit"

    expect(page.current_path).to eql("/trainers/#{@trainer.id}")
    expect(page).to have_content("NOT Jessey")
  end
end