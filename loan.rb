require 'yaml'
MESSAGES = YAML.load_file('loan.yml')

def prompt(message)
  puts message
end

def valid_number?(num)
  num.to_f.to_s == num || num.to_i.to_s == num
end

def formula(amount, rate, years)
  apr = rate.to_f / 100
  monthly_interest = apr / 12
  months = years.to_i * 12
  amount.to_f * (monthly_interest / (1 - ((1 + monthly_interest)**(-months))))
end

prompt(MESSAGES['welcome'])

loop do
  amount = ''
  rate = ''
  years = ''

  loop do
    prompt(MESSAGES['amount'])
    amount = gets.chomp

    if valid_number?(amount)
      break
    else
      prompt("Please enter a valid number")
    end
  end

  loop do
    prompt(MESSAGES['interest'])
    rate = gets.chomp

    if valid_number?(rate)
      break
    else
      prompt("Please enter a valid number")
    end
  end

  loop do
    prompt(MESSAGES['time'])
    years = gets.chomp
    if valid_number?(years)
      break
    else
      prompt("Please enter a valid number")
    end
  end

  puts "We are calculating your payment"
  puts "..."
  puts "We are finished with the calculations"

  result = formula(amount, rate, years)
  puts "Your monthly payments are #{result}"

  prompt("Another calculation?")
  answer = gets.chomp

  break unless answer.downcase().start_with?('y')
end

puts "Thanks for using our loan calculator, goodbye"
