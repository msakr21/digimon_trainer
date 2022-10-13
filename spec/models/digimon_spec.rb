require 'rails_helper'

RSpec.describe Digimon, type: :model do
  it {should belong_to :trainer}
end