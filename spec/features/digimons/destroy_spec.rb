require 'rails_helper'

RSpec.describe 'destroy' do
  before :each do
    @trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    @trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    @digimon = @trainer.digimons.create!(name: "Agu", kind: "Agumon", starter: true, wins: 9)
    @digimon_2 = @trainer.digimons.create!(name: "Gabu", kind: "Gabumon", starter: false, wins: 7)
    @digimon_3 = @trainer_2.digimons.create!(name: "Potato", kind: "Patamon", starter: true, wins: 9)
  end

  it "removes a record of the trainer along with their digimons" do
    visit "/digimons/#{@digimon.id}"

    click_on "delete"
    
    expect(page.current_path).to eql("/digimons")
    expect(page).to_not have_content("Agu")
  end

  it "has a link that allows deleting of a record" do
    visit "/digimons"
    expect(page).to have_content("Agu")

    page.first(:link, "delete").click
    
    expect(page.current_path).to eql("/digimons")
    expect(page).to_not have_content("Agu")
  end
end