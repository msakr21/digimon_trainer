require 'rails_helper'

RSpec.describe 'the trainers show page' do
  it "displays the trainer name" do
    trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    visit "/trainers/#{trainer.id}"

    expect(page).to have_content(trainer.name)
    expect(page).to_not have_content(trainer_2.name)
  end
end