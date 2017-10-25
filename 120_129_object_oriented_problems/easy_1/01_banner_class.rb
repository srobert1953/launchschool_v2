class Banner
  attr_reader :message

  def initialize(message, width = 0)
    @message = message
    @banner_width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def banner_width
    if @banner_width <= message.size
      message.size
    elsif (1..79).include? @banner_width
      @banner_width
    else
      80
    end
  end

  def horizontal_rule
    '+-' + '-' * banner_width + '-+'
  end

  def empty_line
    '| ' + ' ' * banner_width + ' |'
  end

  def message_line
    "| " + message.center(banner_width) + " |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 90)
puts banner

banner = Banner.new('', 10)
puts banner
