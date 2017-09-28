class SecretFile
  def initialize(secret_data)
    @data = secret_data
    @logger = SecurityLogger.new
  end

  def data
    @logger.create_log_entry
    @data
  end
end

class SecurityLogger
  def create_log_entry
    puts "Security log created!"
  end
end

file = SecretFile.new('Top Secret')
p file.data
