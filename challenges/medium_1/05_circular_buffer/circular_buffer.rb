# circular_buffer.rb

class CircularBuffer
  class BufferFullException < StandardError; end
  class BufferEmptyException < StandardError; end

  def initialize(buffer_size)
    @buffer_size = buffer_size
    @buffer = []
  end

  def write(element)
    return if element.nil?
    raise BufferFullException, "Buffer is full" if buffer_full?
    @buffer.push element
  end

  def write!(element)
    return if element.nil?
    @buffer.shift if buffer_full?
    write(element)
  end

  def read
    raise BufferEmptyException, "Buffer is empty" if @buffer.empty?
    @buffer.shift
  end

  def clear
    @buffer = []
  end

  private

  def buffer_full?
    @buffer.size >= @buffer_size
  end
end
