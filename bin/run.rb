require_relative '../config/environment'
def scroll(text, mili_s=0.04)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
end


Trainer.delete_all
puts "Welcome to the world of Pokemon!"
gets.chomp
puts "My name is Professor Oak, but everyone just calls me the Pokemon Professor!"
gets.chomp
puts "The world of Pokemon is full of moral and ethical contradictions that we will never discuss.  Like pokemon faint in battle but
 do not die, however there is a pokemon graveyard in Lavender Town so we know they can die.  What does that mean for you?"
gets.chomp
puts "Please, tell me.  What is your name?"
player_name = gets.chomp
    Trainer.create(name: player_name)
puts "Your name is #{player_name}? Is that correct?"
puts "Respond with Y or N"

response = gets.chomp

if response != "Y" && response != "N"
    puts "Bruh thats the wrong letter"
elsif response == "Y"
    puts "Right!  So your name is #{player_name}!"
elsif response == "N"
    puts "lmao sucks to suck. But okay try again"
end

puts "Well #{player_name}, your whole adventure is about to unfold in front of you!"
gets.chomp
puts "Let's get you your very first Pokemon!  I've found 3 Pokemon just for you to use!  One of them kinda sucks ngl"

puts "Do you want the grass pokemon Bulbasur?"
puts "Or perhaps the fire pokemon Charmander?"
puts "And have you considered the water pokemon Squirtle?"

puts "Press 1 for Bulbasuar, 2 for Charmander, 3 for Squirtle"
choice = gets.chomp

if choice.to_i == 1
    puts "Congrats on the bulbasaur I guess."
elsif choice.to_i == 2
    puts "Excellent choice on the charmander!"
    binding.pry
elsif choice.to_i == 3
    puts "Solid pick on the squirtle."
else
    puts "Well smartass you didn't put in a valid number and now you get nothing.  Jackass"
end



