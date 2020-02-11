def random_pokemon(location)
    arr = []
    Pokemon.all.select {|pokemon| 
        if pokemon[:location] == location
           arr << pokemon[:species]
        end
    }
    arr
end

def get_id
    Pokemon.all.select {|pokemon| 
        if pokemon[:species] == $current_poke
            pokemon[:id]
        end
        }       
end


def pick_location
    puts "Where would you like to catch Pokemon?"
    puts "1. Field"
    puts "2. Ocean"
    puts "3. Forest"
    puts "4. Cave"
    input = gets.chomp.to_i

    puts "Searching..."
    sleep(2)

    if input == 1
        $current_poke = random_pokemon("Field").sample
        puts "A wild #{$current_poke} appeared!"
        sleep(1.5)
        choose_action
    elsif input == 2
        $current_poke = random_pokemon("Ocean").sample
        puts "A wild #{$current_poke} appeared!"
        sleep(3)
        choose_action
    elsif input == 3
        $current_poke = random_pokemon("Forest").sample
        puts "A wild #{$current_poke} appeared!"
        sleep(3)
        choose_action
    elsif input == 4
        $current_poke = random_pokemon("Cave").sample
        puts "A wild #{$current_poke} appeared!"
        sleep(3)
        choose_action
    end
    choose_menu_option
end

def choose_action
    puts "What would you like to do?"
    puts "1. Catch"
    puts "2. Run"

    response = gets.chomp.to_i

    if response == 1
        puts "You threw a pokeball!"
        sleep(0.5)
        puts "It went in!"
        sleep(0.5)
        puts "It wiggled once..."
        sleep(0.5)
        puts "Twice now..."
        sleep(0.5)
        puts "Thrice now..."
        sleep(1.0)
        puts "It was caught!!"
        Party.create(trainer_id: $player.id, trainer_name: $player.name, pokemon_id: get_id[0].id, pokemon_species: get_id[0].species)
    elsif response == 2
        sleep(1.0)
        puts "You got away safely...lil bitch"
    end
end