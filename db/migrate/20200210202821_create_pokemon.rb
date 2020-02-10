class CreatePokemon < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons do |t|
      t.string :species
      t.string :type
      t.string :moves
      t.string :location
    end
  end
end
