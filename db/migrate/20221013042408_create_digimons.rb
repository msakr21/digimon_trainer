class CreateDigimons < ActiveRecord::Migration[5.2]
  def change
    create_table :digimons do |t|
      t.string :name
      t.string :kind
      t.boolean :starter
      t.integer :wins

      t.timestamps
    end
  end
end
