def delete_single
    arr = []
    Party.all.select { |poke|
        if poke.trainer_id == $player_name.id && $poke_to_release == poke.pokemon_species
            arr << poke
        end
    }
        puts "Say goodbye to #{$poke_to_release}."
        current = arr[0]
        current.delete
        sleep (2.0)
        puts "-----------------"
    choose_menu_option
end

def release_single
    i = 0
    puts "Here are the Pokemon you can release. Please enter a number"
    puts "-----------------"
    while i < party_pokemon.length
        puts "#{i +1}. #{party_pokemon[i]}"
        i += 1
    end
    input = gets.chomp.to_i
    if input > 0 || input <= party_pokemon.length
        $poke_to_release = party_pokemon[input - 1]
        delete_single
    end
end

def delete_all
    arr = []
    Party.all.select { |entry|
        if entry.trainer_id == $player_name.id 
            arr << entry.id
        end
    }
    Party.destroy(arr)
    choose_menu_option
end

def delete_options
    puts "What would you like to do?"
    puts "1. Release a single Pokemon?"
    puts "2. Release all Pokemon?"
    puts "3. Go back to Menu?"
    response = gets.chomp

    if response == '1'
        #go to release single
        release_single
    elsif response == '2'
        puts "Are your sure?"
        puts "Please eneter Y or N"
        input = gets.chomp.capitalize
        if input == "Y"
            #got to delete all
            delete_all
        elsif input == "N"
            delete_options
        end
    elsif response == '3'
        choose_menu_option
    end
end
