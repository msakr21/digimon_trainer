require 'rails_helper'

RSpec.describe 'the create trainer' do
  it "creates a new entry in the database upon clicking submit" do
    visit "/trainers/new"

    fill_in "trainer[name]", with: "Jessey"
    fill_in "trainer[age]", with: "102"
    choose "false"
    
    click_on "Create Trainer"
  
    expect(page.current_path).to eql('/trainers')
    expect(page).to have_content("Jessey")
  end
end