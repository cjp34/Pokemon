class Trainer < ActiveRecord::Base
    has_many :parties
    has_many :pokemons, through: :parties
end