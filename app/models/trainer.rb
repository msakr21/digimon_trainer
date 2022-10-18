class Trainer < ApplicationRecord
  has_many :digimons, dependent: :delete_all

  def self.order_by_created_at
    order(created_at: :desc)
  end

  def digimons_count
    self.digimons.count
  end

  def order_digimons_by(parameters)
    self.digimons.order(parameters)
  end
end