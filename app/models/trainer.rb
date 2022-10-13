class Trainer < ApplicationRecord
  has_many :digimons

  def digimons_count
    # require 'pry';binding.pry
    self.digimons.length
  end
end