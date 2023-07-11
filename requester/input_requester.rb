class InputRequester
  def initialize
    @input = nil
  end

  def request_input_with_message(message, input_type)
    puts message
    @input = gets.chomp if input_type == 'string'
    @input = gets.chomp.to_i if input_type == 'integer'
    @input = gets.chomp.to_f if input_type == 'float'
    @input = gets.chomp.to_sym if input_type == 'symbol'
    @input = gets.chomp.to_bool if input_type == 'boolean'
    @input = gets.chomp.to_date if input_type == 'date'
  end

  attr_reader :input
end
