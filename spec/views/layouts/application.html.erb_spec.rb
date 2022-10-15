require 'rails_helper'

describe "layouts/application" do

  context "links to trainers and digimons as headers" do
    it "should display links to trainers and digimons at the top of every page" do
      render
      rendered.should have_selector(:css, 'a[href="/trainers"]')
      rendered.should have_selector(:css, 'a[href="/digimons"]')
    end
  end
end