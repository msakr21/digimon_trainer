require 'rails_helper'

RSpec.describe 'the trainers index page' do
  before :each do
    @trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    @trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
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
end