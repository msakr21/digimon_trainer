class Digimon <ApplicationRecord
  belongs_to :trainer


  def self.filter_by_wins(parameters)
    where("wins >= ?", parameters)
  end
end