require 'rails_helper'

RSpec.describe Trainer, type: :model do
  it {should have_many :digimons}
end