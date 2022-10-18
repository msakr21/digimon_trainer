require 'rails_helper'

RSpec.describe 'the @trainers show page' do
  before :each do
    @trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    @trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    @digimon = @trainer.digimons.create!(name: "Agu", kind: "Agumon", starter: true, wins: 9)
    @digimon_2 = @trainer.digimons.create!(name: "Gabu", kind: "Gabumon", starter: false, wins: 7)
    @digimon_3 = @trainer_2.digimons.create!(name: "Potato", kind: "Patamon", starter: false, wins: 9)
  end

  it "displays a trainer's information" do
    visit "/trainers/#{@trainer.id}"

    expect(page).to have_content(@trainer.name)
    expect(page).to have_content(@trainer.age)
    expect(page).to have_content(@trainer.tutorial_completed)
    expect(page).to have_content(@trainer.created_at)
    expect(page).to have_content(@trainer.updated_at)
    expect(page).to_not have_content(@trainer_2.name)
  end

  it "displays how many digimons a trainer has" do
    visit "/trainers/#{@trainer.id}"

    expect(page).to have_content(@trainer.digimons_count)
  end

  it "links to a list of digimon for the trainer" do
    visit "/trainers/#{@trainer.id}"
    # save_and_open_page
    expect(page).to have_selector(:css, "a[href='/trainers/#{@trainer.id}/digimons']")
  end

  it "has a link to edit the trainer information" do
    visit "/trainers/#{@trainer.id}"

    expect(page).to have_selector(:css, "a[href='/trainers/#{@trainer.id}/edit']")
  end

  it "has a button to delete the trainer's record" do
    visit "/trainers/#{@trainer.id}"

    expect(page).to have_button("delete")
  end
end