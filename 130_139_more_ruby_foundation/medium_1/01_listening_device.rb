class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    if block_given?
      record yield
    end
  end

  def play
    @recordings.last
  end
end

listener = Device.new
listener.listen
listener.listen { "Hello World" }
listener.listen { "I am listening" }
puts listener.play
