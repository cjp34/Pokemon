class CreateParty < ActiveRecord::Migration[5.0]
  def change
    create_table :parties do |t|
      t.integer :trainer_id
      t.string :trainer_name
      t.integer :pokemon_id
      t.string :pokemon_species
    end
  end
end
