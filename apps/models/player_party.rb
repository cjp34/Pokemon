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
    puts "Would you like to release any Pokemon?"
    puts "Respond with Y or N"
    response = gets.chomp.capitalize
    if response == "Y"
        #delete model options
        delete_options
    elsif response == "N"
        choose_menu_option
    end
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
