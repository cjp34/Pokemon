def search_species
    puts "What species are you looking for?"
    input = gets.chomp.capitalize
    Pokemon.all.select {|pokemon| 
        if pokemon[:species] == input
            puts "Pokedex Number: #{pokemon[:id]}"
            puts "Pokemon Species: #{pokemon[:species]}"
            puts "Pokemon Type: #{pokemon[:poke_type]}"
            puts "Pokemon Location: #{pokemon[:location]}"
        end
        }       
end

def search_by_type
    puts "What type of Pokemon are you looking for?"
    input = gets.chomp.capitalize
    Pokemon.all.select {|pokemon| 
        if pokemon[:poke_type].include? input
            puts "Pokemon Species: #{pokemon[:species]}"
        end
    }
end

def search_by_location
    puts "What location do you want to search?"
    input = gets.chomp.capitalize
    Pokemon.all.select {|pokemon| 
        if pokemon[:location] == input
            puts "Pokemon Species: #{pokemon[:species]}"
        end
    }
end

def search_by_id
    puts "What Pokemon ID are you looking for?"
    input = gets.chomp.to_i
    Pokemon.all.select {|pokemon| 
        if pokemon[:id] == input
            puts "Pokedex Number: #{pokemon[:id]}"
            puts "Pokemon Species: #{pokemon[:species]}"
            puts "Pokemon Type: #{pokemon[:poke_type]}"
            puts "Pokemon Location: #{pokemon[:location]}"
        end
    }
end

def search_options
    #give user search options
    puts "How would you like to search?"
    puts "1. Search by Pokemon ID"
    puts "2. Search by Pokemon species"
    puts "3. Search by Pokemon type"
    puts "4. Search by Pokemon location"
    input = gets.chomp.to_i

    if input == 1
        #send to search_by_id
        puts "-----------------"
        search_by_id
    elsif input == 2
        #send to search_by_species
        puts "-----------------"
        search_species
    elsif input == 3
        #send to search_by_type
        puts "-----------------"
        search_by_type
    elsif input == 4
        #send to search_by_location
        puts "-----------------"
        search_by_location
    end
    puts "-----------------"
    choose_menu_option
end
