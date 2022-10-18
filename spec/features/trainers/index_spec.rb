require 'rails_helper'

RSpec.describe 'the trainers index page' do
  before :each do
    @trainer_3 = Trainer.create!(name: "Hamada", age: 29, tutorial_completed: false)
    @trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    @trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    @digimon_2 = @trainer.digimons.create!(name: "Gabu", kind: "Gabumon", starter: false, wins: 7)
    @digimon = @trainer.digimons.create!(name: "Agu", kind: "Agumon", starter: true, wins: 9)
    @digimon_3 = @trainer_2.digimons.create!(name: "Potato", kind: "Patamon", starter: false, wins: 9)
    @digimon_4 = @trainer_3.digimons.create!(name: "Devi", kind: "Devimon", starter: false, wins: 7)
    @digimon_5 = @trainer_3.digimons.create!(name: "Gato", kind: "Gatomon", starter: false, wins: 7)
    @digimon_6 = @trainer.digimons.create!(name: "Pal", kind: "Palmon", starter: false, wins: 7)
  end

  it "displays a list of trainers" do
    visit "/trainers"

    expect(page).to have_content(@trainer.name)
    expect(page).to_not have_content(@trainer.age)
    expect(page).to_not have_content(@trainer.tutorial_completed)
    expect(page).to have_content(@trainer_2.name)
  end

  it "lists trainers in order of most recently created" do
    visit "/trainers"

    expect("Mostafa").to appear_before("Abbas", only_text: true)
  end

  it "has a link that redirects to '/trainers/new'" do
    visit "/trainers"

    expect(page).to have_selector(:css, 'a[href="/trainers/new"]')
  end

  it "has a link that allows editing of a record" do
    visit "/trainers"

    expect(page).to have_selector(:css, "a[href='/trainers/#{@trainer.id}/edit']")
    expect(page).to have_selector(:css, "a[href='/trainers/#{@trainer_2.id}/edit']")
    expect(page).to have_selector(:css, "a[href='/trainers/#{@trainer_3.id}/edit']")
    expect(page).to have_link("edit", count: 3)
  end

  it "has a link that allows deleting of a record" do
    visit "/trainers"

    expect(page).to have_link("delete", count: 3)
  end

  it "has a link to list digimons in order of how many digimons they have" do
    visit "/trainers"

    expect(page).to have_link("Sort by Digimon Count")
  end

  it "sorts the digimon in the trainer/digimon index page in alphabatical order" do
    visit "/trainers"
    
    click_on "Sort by Digimon Count"

    expect(current_path).to eq("/trainers")
    expect("Mostafa").to appear_before("Abbas", only_text: true)
    expect("Mostafa").to appear_before("Hamada", only_text: true)
    expect("Hamada").to appear_before("Abbas", only_text: true)
  end
end