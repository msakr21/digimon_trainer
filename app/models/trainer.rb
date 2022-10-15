class Trainer < ApplicationRecord
  has_many :digimons

  def digimons_count
    self.digimons.length
  end
end