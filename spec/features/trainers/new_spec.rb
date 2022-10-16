require 'rails_helper'

RSpec.describe 'the new trainer page' do
  it "displays a fillable form" do
    visit "/trainers/new"

    expect(page).to have_content("New Trainer Submission Form")
    expect(page).to have_content("Name:")
    expect(page).to have_content("Age:")
    expect(page).to have_content("Tutorial Completed?")
    expect(page).to have_selector(:css, 'form')
  end

  it "creates a new entry in the database upon clicking submit" do
    visit "/trainers/new"

    fill_in "trainer[name]", with: "Jessey"
    fill_in "trainer[age]", with: "102"
    choose "false"
    
    click_on "Submit"

    expect(page.current_path).to eql('/trainers')
    expect(page).to have_content("Jessey")
  end
end