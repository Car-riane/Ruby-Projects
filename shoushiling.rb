require 'yaml'
MESSAGES = YAML.load_file('shoushiling.yml')

choices = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

MOVES = {
    'rock' => ['scissors', 'lizard'],
    'paper' => ['spock', 'rock'],
    'scissors' => ['paper', 'lizard'],
    'lizard' => ['spock', 'paper'],
    'spock' => ['scissors', 'rock']
}

def prompt(message)
  sleep(1)
  puts(message)
end

def win?(first, second)
  MOVES[first].include?(second) 
end


def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer Won!")
  else
    prompt("It's a tie!")
  end
end

player_win = 0
computer_win = 0
round = 0

loop do
  player_choice = ''
  loop do
    prompt(MESSAGES['move'])
    choice = gets.chomp
    if choices.key?(choice) || choices.value?(choice)
      player_choice = choices.key?(choice) ? choices[choice] : choice  # Convert key to value if necessary
      break
    else
      prompt("That is an invalid choice.")
    end
  end

  computer_choice = choices.values.sample

  prompt("You chose: #{player_choice}")
  prompt("Computer chose: #{computer_choice}")

  display_results(player_choice, computer_choice)

  if win?(player_choice, computer_choice)
    player_win += 1
  elsif win?(computer_choice, player_choice)
    computer_win += 1
  else 
    computer_win += 1
    player_win += 1
  end

  prompt("You have #{player_win} and Computer has #{computer_win}.")
  round += 1
  prompt("Round #{round}")
  prompt(MESSAGES['winner']) if player_win == 3
  prompt(MESSAGES['computer_winner']) if computer_win == 3
  break if computer_win == 3 || player_win == 3
  prompt(MESSAGES['again'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('farewell')
