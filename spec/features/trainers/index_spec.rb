require 'rails_helper'

RSpec.describe 'the trainers index page' do
  it "displays a list of trainers" do
    trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    visit "/trainers"

    expect(page).to have_content(trainer.name)
    expect(page).to_not have_content(trainer.age)
    expect(page).to_not have_content(trainer.tutorial_completed)
    expect(page).to have_content(trainer_2.name)
  end

  it "lists trainers in order of most recently created" do
    trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    visit "/trainers"

    expect("Mostafa").to appear_before("Abbas", only_text: true)
  end
end