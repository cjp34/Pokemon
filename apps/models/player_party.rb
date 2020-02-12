def show_party
    arr = []
    Party.all.select { |poke|
        if poke.trainer_id == $player_name.id 
            arr << poke.pokemon_species
        end
    }
    puts "Your Party is:"

    arr.each do |name| puts name end
        puts "-----------------"
        gets.chomp
        choose_menu_option
end

def check_party_length
    arr = []
    Party.all.select { |poke|
        if poke.trainer_id == $player_name.id 
            arr << poke.pokemon_species
        end
    }
    arr.length 
end

def clear_players_party
    arr = []
    Party.all.select { |entry|
        if entry.trainer_id == $player_name.id 
            arr << entry.id
        end
    }
    Party.destroy(arr)
end