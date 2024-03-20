moves = %w(rock paper scissors lizard spock)
abbrev = %w(r p sc l sp)

TURN = {
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

def win?(first, second); end

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
  choice = ''
  loop do
    prompt("Choose one: #{moves.join(', ') or use an abbreviation}")
    choice = gets.chomp

    if moves.include?(choice) || abbrev.include?(choice)
      break
    else
      prompt("That is an invalid choice.")
    end
  end

  computer_choice = MOVES.keys.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    player_win += 1
  elsif win?(computer_choice, choice)
    computer_win += 1
  else
    player_win += 1
    computer_win += 1
  end

  prompt("You have #{player_win} and Computer has #{computer_win}.")
  round += 1
  prompt("Round #{round}")
  prompt('winner') if player_win == 3
  prompt('computer_winner') if computer_win == 3
  break if computer_win == 3 || player_win == 3
  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
