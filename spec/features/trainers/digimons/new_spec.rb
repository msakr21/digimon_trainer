require 'rails_helper'

# User Story 13, Parent Child Creation 

# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

RSpec.describe 'Trainers Digimons new' do
  before :each do
    @trainer = Trainer.create!(name: "Mostafa", age: 27, tutorial_completed: false)
    @trainer_2 = Trainer.create!(name: "Abbas", age: 28, tutorial_completed: false)
    @digimon = @trainer.digimons.create!(name: "Agu", kind: "Agumon", starter: true, wins: 9)
    # @digimon_2 = @trainer.digimons.create!(name: "Gabu", kind: "Gabumon", starter: false, wins: 7)
    @digimon_3 = @trainer_2.digimons.create!(name: "Potato", kind: "Patamon", starter: false, wins: 9)
  end
  
  it "displays a fillable form" do
    # require 'pry';binding.pry
    visit "/trainers/#{@trainer.id}/digimons/new"

    expect(page).to have_content("New Digimon Submission Form")
    expect(page).to have_content("Name:")
    expect(page).to have_content("Kind:")
    expect(page).to have_content("Starter?")
    expect(page).to have_content("Wins:")
    expect(page).to have_content("Trainer Name:")
    expect(page).to have_selector(:css, 'form')
  end

  xit "creates a new entry in the database upon clicking submit" do
    visit "/trainers/new"

    fill_in "trainer[name]", with: "Jessey"
    fill_in "trainer[age]", with: "102"
    choose "false"
    
    click_on "Submit"

    expect(page.current_path).to eql('/trainers')
    expect(page).to have_content("Jessey")
  end
end

