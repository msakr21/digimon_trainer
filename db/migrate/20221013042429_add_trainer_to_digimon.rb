class AddTrainerToDigimon < ActiveRecord::Migration[5.2]
  def change
    add_reference :digimons, :trainer, foreign_key: true
  end
end
