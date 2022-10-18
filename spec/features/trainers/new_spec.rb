require 'rails_helper'

RSpec.describe 'the new trainer page' do
  it "displays a fillable form" do
    visit "/trainers/new"

    expect(page).to have_content("New Trainer Submission Form")
    expect(page).to have_content("Name")
    expect(page).to have_content("Age")
    expect(page).to have_content("Tutorial completed?")
    expect(page).to have_selector(:css, 'form')
  end
end