class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end

  # def volume
  #   @volume
  # end
end

cube = Cube.new(5)
p cube.volume
puts cube
