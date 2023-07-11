class InputValidator
  def validate_input?(input)
    raise ArgumentError, 'Input is empty' if input.empty?
    raise ArgumentError, 'Input is nil' if input.nil?
    raise ArgumentError, 'Input is not a string' unless input.is_a?(String)

    input
  end
end
