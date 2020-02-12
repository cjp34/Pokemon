
require_relative '../config/environment'
def scroll(text, mili_s=0.04)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
end

# This is after they have selected continue
def choose_menu_option
    puts "What would you like to do?"
    puts "1. Go catch new Pokemon"
    puts "2. Search your Pokedex"
    puts "3. Check your party"
    input = gets.chomp.to_i

    if input == 1
        #go to catch.rb (pick_location)
        pick_location
    elsif input == 2
        #go to sarching.rb (search_options)
        search_options
    elsif input == 3
        #go to party.rb?
        show_party
    end
end


def get_player
    puts "Please enter your name"
    input = gets.chomp
    $player = Trainer.find_by name: input
    puts "Welcome back #{input}!"
    sleep (1)
    choose_menu_option
end

def confirm_name
puts "Your name is #{$player_name}? Is that correct?"
puts "Respond with Y or N"

response = gets.chomp
    if response != "Y" && response != "N"
        puts "Bruh thats the wrong letter"
    elsif response == "Y"
        puts "Right!  So your name is #{$player_name}!"
        Trainer.create(name: $player_name)
        choose_menu_option
    elsif response == "N"
        puts "lmao sucks to suck. But okay try again"
        ask_name
    end
end

def ask_name
puts "Please, tell me.  What is your name?"
$player_name = gets.chomp
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
    ask_name
end

puts <<-TITLE
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

puts "1. New Game"
puts "2. Continue"
start_y = gets.chomp.to_i

if start_y == 2
    get_player
elsif start_y == 1
    new_game_init
end
















# $player_name = ""

# Trainer.delete_all
# def create_new_trainer
# puts "Welcome to the world of Pokemon!"
# gets.chomp
# puts "My name is Professor Oak, but everyone just calls me the Pokemon Professor!"
# gets.chomp
# puts "The world of Pokemon is full of moral and ethical contradictions that we will never discuss.  Like pokemon faint in battle but
#  do not die, however there is a pokemon graveyard in Lavender Town so we know they can die.  What does that mean for you?"
# gets.chomp
# end

# def ask_name
# puts "Please, tell me.  What is your name?"
# $player_name = gets.chomp
# end

# def confirm_name
# puts "Your name is #{$player_name}? Is that correct?"
# puts "Respond with Y or N"

# response = gets.chomp
#     if response != "Y" && response != "N"
#         puts "Bruh thats the wrong letter"
#     elsif response == "Y"
#         puts "Right!  So your name is #{$player_name}!"
#         Trainer.create(name: $player_name)
#     elsif response == "N"
#         puts "lmao sucks to suck. But okay try again"
#         ask_name
#     end
# end

# create_new_trainer

# ask_name

# confirm_name

# puts "Well #{player_name}, your whole adventure is about to unfold in front of you!"
# gets.chomp
# puts "Let's get you your very first Pokemon!  I've found 3 Pokemon just for you to use!  One of them kinda sucks ngl"

# puts "Do you want the grass pokemon Bulbasur?"
# puts "Or perhaps the fire pokemon Charmander?"
# puts "And have you considered the water pokemon Squirtle?"

# puts "Press 1 for Bulbasuar, 2 for Charmander, 3 for Squirtle"
# choice = gets.chomp

# if choice.to_i == 1
#     puts "Congrats on the bulbasaur I guess."
# elsif choice.to_i == 2
#     puts "Excellent choice on the charmander!"
#     #binding.pry
# elsif choice.to_i == 3
#     puts "Solid pick on the squirtle."
# else
#     puts "Well smartass you didn't put in a valid number and now you get nothing.  Jackass"
# end

# # def create_party
# #     poke_id = Pokemon.all.select {|pokemon| }

# #     Party.new(trainer_id: Trainer.last.id, pokemon_id:  )
# # end

# def get_poke_id(string)
#     Pokemon.all.select { |x| x.species == string}.id 
# end

# binding.pry

