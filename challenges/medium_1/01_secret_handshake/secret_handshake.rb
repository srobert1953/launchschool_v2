class SecretHandshake
  COMMANDS = {
    1     => 'wink',
    10    => 'double blink',
    100   => 'close your eyes',
    1000  => 'jump'
  }
  REVERSE_COMMAND = 10000

  attr_reader :binary_number

  def initialize(number)
    @binary_number = convert_to_binary_number(number)
  end

  def commands
    result = []
    number = @binary_number.to_i

    1.upto(@binary_number.size) do |nth|
      secret_number = number % 10**nth

      if secret_number == REVERSE_COMMAND
        result.reverse!
        next
      end

      result << COMMANDS[secret_number] unless secret_number == 0
      number -= secret_number
    end

    result
  end

  private

  def convert_to_binary_number(number)
    if number.is_a?(Integer)
      number.to_s(2)
    else
      return 0 unless /\b[0|1]+\b/.match(number.to_s)
      number
    end
  end
end
