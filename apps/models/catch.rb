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
    puts "1. #{"Field".yellow}"
    puts "2. #{"Ocean".light_blue}"
    puts "3. #{"Forest".green}"
    puts "4. #{"Cave".swap}"
    input = gets.chomp.capitalize

    puts "Searching..."
    sleep(2)

    if input == "1" || "Field"
        $current_poke = random_pokemon("Field").sample
        puts "A wild #{$current_poke} appeared!"
        sleep(1.5)
        puts "-----------------"
        choose_action
    elsif input == "2" || "Ocean"
        $current_poke = random_pokemon("Ocean").sample
        puts "A wild #{$current_poke} appeared!"
        sleep(3)
        puts "-----------------"
        choose_action
    elsif input == "3" || "Forest"
        $current_poke = random_pokemon("Forest").sample
        puts "A wild #{$current_poke} appeared!"
        sleep(3)
        puts "-----------------"
        choose_action
    elsif input == "4" || "Cave"
        $current_poke = random_pokemon("Cave").sample
        puts "A wild #{$current_poke} appeared!"
        sleep(3)
        puts "-----------------"
        choose_action
    elsif input == "Seafoam Isles"
        $current_poke = random_pokemon("Seafoam Isles").sample
        puts "The legendary Bird of Ice #{$current_poke} appeared!"
        sleep(3)
        puts "-----------------"
        choose_action
    elsif input == "Power Plant"
        $current_poke = random_pokemon("Power Plant").sample
        puts "Your nosy ass found the Legendary Bird of Thunder #{$current_poke}!"
        sleep(3)
        puts "-----------------"
        choose_action
    elsif input == "Mt. Ember"
        $current_poke = random_pokemon("Mt. Ember").sample
        puts "How did you find the Legendary Bird of Fire #{$current_poke}???"
        sleep(3)
        puts "-----------------"
        choose_action
    elsif input == "Cerulean Cave"
        $current_poke = random_pokemon("Cerulean Cave").sample
        puts "The apotheosis of mankind's arrogance #{$current_poke} appears before you..."
        sleep(3)
        puts "-----------------"
        choose_action
    elsif input == "Faraway Island"
        $current_poke = random_pokemon("Faraway Island").sample
        puts "The ancestor of all Pokemon #{$current_poke} appeared!"
        sleep(3)
        puts "-----------------"
        choose_action
    else
        puts "This place doesn't exist!"
        pick_location
    end
    puts "-----------------"
    choose_menu_option
end

def choose_action
    puts "What would you like to do?"
    puts "1. Catch"
    puts "2. Run"

    response = gets.chomp.capitalize
    
    if response == '1' || "Catch"
        puts "You threw a pokeball!"
        sleep(1.0)
        puts "It went in!"
        sleep(1.5)
        puts "It wiggled once..."
        sleep(1.5)
        puts "Twice now..."
        sleep(1.5)
        puts "Thrice now..."
        sleep(2.0)
        puts "-----------------"
        m = rand(255)
        if m <= get_id[0].catch_rate
            puts "It was caught!!"
            sleep(2.0)
            Party.create(trainer_id: $player_name.id, trainer_name: $player_name.name, pokemon_id: get_id[0].id, pokemon_species: get_id[0].species)
        else
            $catch_tries -= 1
            puts "Yikes! It wasn't caught!! You have #{$catch_tries} more chance(s) to catch!"
            puts "-----------------"
            if $catch_tries > 0
                choose_action
            else
                puts "You're outta tries loser"
                puts "#{$current_poke} ran away!!"
                puts "-----------------"
                choose_menu_option
            end
        end
    elsif response == '2' || "Run"
        sleep(1.0)
        puts "You got away safely...lil bitch"
    else
        puts "Invalid input"
        choose_action
    end
end