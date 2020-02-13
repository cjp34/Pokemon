require 'colorize'
require_relative '../config/environment'
def scroll(text, mili_s=0.04)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
end

# This is after they have selected continue
def choose_menu_option
    $catch_tries = 3
    puts "What would you like to do?"
    puts "1. Go catch new Pokemon"
    puts "2. Search your Pokedex"
    puts "3. Check your party"
    puts "4. Evolve Pokemon"
    input = gets.chomp

    if input == '1'
        if check_party_length == 6
            puts "Your party is full"
            puts "-----------------"
            choose_menu_option
        else
        #go to catch.rb (pick_location)
        pick_location
        end
    elsif input == '2'
        #go to sarching.rb (search_options)
        search_options
    elsif input == '3'
        #go to party.rb?
        puts "-----------------"
        show_party
    elsif input == '4'
        puts "-----------------"
        show_evo_options
    elsif input == "exit"
        abort
    else
        puts "Input invalid"
        choose_menu_option 
    end
end


def get_player
    puts "Please enter your name"
    input = gets.chomp
    $player_name = Trainer.find_or_create_by(name: input)
    puts "Welcome back #{input}!"
    sleep (1)
    puts "-----------------"
    choose_menu_option
end

def first_pokemon
puts "Well #{$player_name.name}, your whole adventure is about to unfold in front of you!"
gets.chomp
puts "Let's get you your very first Pokemon!  I've found 3 Pokemon just for you to use!  One of them kinda sucks ngl"

puts "Do you want the " + "grass ".colorize(:green) + "pokemon "+ "Bulbasur".colorize(:green)+"?"
puts "Or perhaps the " + "fire ".colorize(:red) + "pokemon "+ "Charmander".colorize(:red)+"?"
puts "And have you considered the " + "water ".colorize(:blue) + "pokemon "+ "Squirtle".colorize(:blue)+"?"
puts "Press 1 for #{"Bulbasuar".green}, 2 for #{"Charmander".red}, 3 for #{"Squirtle".blue}"
choice = gets.chomp

if choice.to_i == 1
    puts "Congrats on the #{"Bulbasuar".green} I guess."
    Party.create(trainer_id: Trainer.last.id, trainer_name: $player_name.name, pokemon_id: 1, pokemon_species: "Bulbasaur")
elsif choice.to_i == 2
    puts "Excellent choice on the #{"Charmander".red}!"
    Party.create(trainer_id: Trainer.last.id, trainer_name: $player_name.name, pokemon_id: 4, pokemon_species: "Charmander")
elsif choice.to_i == 3
    puts "Solid pick on the #{"Squirtle".blue}!"
    Party.create(trainer_id: Trainer.last.id, trainer_name: $player_name.name, pokemon_id: 7, pokemon_species: "Squirtle")
else
    puts "Well smartass you didn't put in a valid number and now you get nothing.  Jackass"
end
    puts "-----------------"
    choose_menu_option
end

def confirm_name
puts "Your name is #{$player_name}? Is that correct?"
puts "Respond with Y or N"

response = gets.chomp.capitalize
    if response != "Y" && response != "N"
        puts "Bruh thats the wrong letter"
    elsif response == "Y"
        puts "Right!  So your name is #{$player_name}!"
        $player_name = Trainer.find_or_create_by(name: $player_name)
        puts "-----------------"
        first_pokemon
    elsif response == "N"
        puts "lmao sucks to suck. But okay try again"
        puts "-----------------"
        ask_name
    else
        puts "Input invalid"
        confirm_name
    end
end

def ask_name
puts "Please, tell me.  What is your name?"
$player_name = gets.chomp
puts "-----------------"
confirm_name
end

def new_game_init
    puts "Welcome to the world of Pokemon!"
    gets.chomp
    puts "My name is Professor Oak, but everyone just calls me the Pokemon Professor!"
    gets.chomp
    puts "The world of Pokemon is full of moral and ethical contradictions that we will never discuss.  Like pokemon faint in battle but
     do not die, however there is a pokemon graveyard in Lavender Town so we know they can die.  What does that mean for you?"
    gets.chomp
    puts "-----------------"
    ask_name
end

title = <<-TITLE
                                  ,'\\
    _.----.        ____         ,'  _\\   ___    ___     ____
_,-'       `.     |    |  /`.   \\,-'    |   \\  /   |   |    \\  |`.
\\     __    \\     '-.  | /   `.  ___    |    \\/    |   '-.   \\ |  |
 \\.   \\ \\   |  __   |  |/    ,','_  `.  |          | __  |    \\|  |
  \\    \\/   /,' _`. |      ,' // / /    |          ,' _`.|     |  |
   \\     ,-'/  /   \\    ,'   | \\/ / ,`. |         /  /   \\  |     |
    \\    \\ |   \\_/  |   `-.  \\    `'  / |  |    ||   \\_/  | |\\    |
     \\    \\ \\      /       `-.`.___,-'  |  |\\  /| \\      /  | |   |
      \\    \\ `.__,' |  |`-._    `|      |__| \\/ |  `.__,'|  | |   |
       \\_.-'        |__|    `-._ |              '-.|     '-.| |   |
                                `'                            '-._|
TITLE

puts title.colorize(:yellow)
system('say "Welcome to Pokemon"')

def start
    puts "1. New Game"
    puts "2. Continue

    "
    start_y = gets.chomp

    if start_y == '2'
        puts "-----------------"
        get_player
    elsif start_y == '1'
        puts "-----------------"
        new_game_init
    elsif start_y == "exit"
        puts "Later nerd"
        abort
    else
        puts "Please select a valid option."
        start
    end
end

start















