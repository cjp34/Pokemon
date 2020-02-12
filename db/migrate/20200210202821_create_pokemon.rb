class CreatePokemon < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons do |t|
      t.string :species
      t.string :poke_type
      t.string :location
      t.integer :catch_rate
      t.boolean :evolve
    end
  end
end
