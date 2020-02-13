def get_poke_species(id)
    Pokemon.all.select {|pokemon|
        if pokemon[:id] == id
            pokemon[:species]
        end
    }[0].species
end

def can_evolve
    Pokemon.all.select {|pokemon|
        pokemon.evolve == "True"
    }.map { |poke| poke.species}
end

def party_pokemon
    arr = []
    Party.all.select { |poke|
        if poke.trainer_id == $player_name.id
            arr << poke.pokemon_species
        end
        }
    arr
end

def party_evolve
    party_pokemon & can_evolve
end

def show_evo_options
    if party_evolve.length == 0
        puts "You don’t have any pokemon to evolve!"
        puts "-----------------"
        choose_menu_option
    else
        i = 0
        puts "Here are the Pokemon you can evolve. Please enter a number"
        puts "-----------------"
        while i < party_evolve.length
            puts "#{i +1}. #{party_evolve[i]}"
            i += 1
        end
        input = gets.chomp.to_i
        if input > 0 || input <= party_evolve.length
            $poke_to_evolve = party_evolve[input - 1]
            evolve
        else
            puts "This is not a valid selection"
            show_evo_options
        end
    end
end

def evolve
    arr = []
    Party.all.select { |poke|
        if poke.trainer_id == $player_name.id && $poke_to_evolve == poke.pokemon_species
            arr << poke
        end
    }
        current = arr[0]
        current.update(pokemon_id: arr[0].pokemon_id + 1)
        current.update(pokemon_species: get_poke_species(current.pokemon_id))
    puts "What? #{$poke_to_evolve} is evolving!"
    sleep (2.0)
    puts "Congratulations #{$poke_to_evolve} evolved to a #{current.pokemon_species}!"
    sleep (2.0)
    puts "-----------------"
    choose_menu_option
end
