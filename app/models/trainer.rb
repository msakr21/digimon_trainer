class Trainer < ApplicationRecord
  has_many :digimons, dependent: :delete_all

  def digimons_count
    self.digimons.length
  end
end