require 'yaml'
MESSAGES = YAML.load_file('loan.yml')
MONTHS_IN_YEAR = 12

def prompt(message)
  sleep(1)
  puts message
end

def valid_number?(num)
  (num.to_f.to_s == num) && (num.to_f > 0) || 
  (num.to_i.to_s == num) && (num.to_i > 0)
end

def monthly_payment_formula(amount, rate, years)
  apr = rate.to_f / 100
  monthly_interest = apr / MONTHS_IN_YEAR
  months = years.to_f * MONTHS_IN_YEAR
  amount.to_f * (monthly_interest / (1 - ((1 + monthly_interest)**(-months))))
end

def display_calculating_messages
  prompt(MESSAGES['update'])
  prompt(MESSAGES['loading'])
  prompt(MESSAGES['done'])
end

def goodbye
  prompt(MESSAGES['goodbye'])
end

def welcome
  prompt(MESSAGES['welcome'])
end

amount = ''
rate = ''
years = ''

loop do
  welcome
  
  loop do
    prompt(MESSAGES['amount'])
    amount = gets.chomp

    if valid_number?(amount) 
      break
    else
      prompt("invalid")
    end
  end

  loop do
    prompt(MESSAGES['interest'])
    rate = gets.chomp

    if valid_number?(rate) 
      break
    else
      prompt("invalid")
    end
  end

  loop do
    prompt(MESSAGES['time'])
    years = gets.chomp
    if valid_number?(years)
      break
    else
      prompt("invalid")
    end
  end

  display_calculating_messages

  result = monthly_payment_formula(amount, rate, years)
  prompt("Your monthly payments are $#{result.round(2)}.")

  prompt("again?")
  answer = gets.chomp

  break unless answer.downcase().start_with?('y')
end

goodbye