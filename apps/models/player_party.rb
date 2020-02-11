def show_party
    arr = []
    Party.all.select { |poke|
        if poke.trainer_id == $player.id 
            arr << poke.pokemon_species
        end
    }
    arr.each do |name| puts name end
end