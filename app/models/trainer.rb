class Trainer < ApplicationRecord
  has_many :digimons, dependent: :delete_all

  def self.order_by_created_at
    order(created_at: :desc)
  end

  def digimons_count
    self.digimons.count
  end

  def self.group_by_count
    select("trainers.*, COUNT(digimons.id) digimon_count").joins(:digimons).group("trainers.id").order("digimon_count DESC")
  end

  def order_digimons_by(parameters)
    self.digimons.order(parameters)
  end
end