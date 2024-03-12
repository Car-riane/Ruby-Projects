# ask the user for two numbers
# ask the user for an operation to perform
# perform the operaation on the two numbers
# output the results
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts(message)
end

def valid_number?(number)
  def integer?(input)
    input.to_i.to_s == input
  end
  
  def float?(input)
    input.to_f.to_s == input
  end
  
  def number?(input)
    integer?(input) || float?(input)
  end
  
  number?(number)
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hey #{name}")

loop do
  number1 = ''
  loop do
    prompt(MESSAGES['number1'])
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['invalid'])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['number2'])
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['invalid'])
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['choose'])
    end
  end
  prompt("#{operation_to_message(operator)} the two numbers...")
  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_i / number2.to_i
           end

  prompt("The result is #{result}")
  prompt(MESSAGES['again'])
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['end'])

