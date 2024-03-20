VALID_CHOICES = %w(rock paper scissors lizard spock)

TURNS = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'lizard' => %w(spock paper),
  'spock' => %w(rock scissors)
}

def prompt(message)
  puts(message)
end

def win?(first, second)
  TURNS[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You Won!")
  elsif win?(computer, player)
    prompt("Computer Won!")
  else
    prompt("It's a tie!")
  end
end

wins = 0
cwins = 0
round = 1

loop do
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That is an invalid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    wins += 1
  elsif win?(computer_choice, choice)
    cwins += 1
  else
    wins += 1
    cwins += 1
  end

  prompt("Player has #{wins} and Computer has #{cwins}")
  prompt("Round #{round}")
  round += 1

  break if wins == 3 || cwins == 3
  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

if wins == 3
  prompt("You are the winner!")
else
  prompt("The Computer is the winner")
end

prompt("Thank you for playing. Goodbye!")
