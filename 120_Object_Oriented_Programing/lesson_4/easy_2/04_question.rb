class BeeWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

wild = BeeWax.new('wild wax')
wild.describe_type
