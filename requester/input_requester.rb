require 'date'
class InputRequester
  def request_input_with_message(message, input_type)
    puts message
    case input_type
    when 'string'
      gets.chomp
    when 'date'
      Date.parse(gets.chomp)
    when 'integer'
      gets.chomp.to_i
    end
  end
end
