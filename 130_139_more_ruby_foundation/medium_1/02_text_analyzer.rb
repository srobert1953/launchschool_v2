class TextAnalyzer
  def process
    file = File.open('02_text.txt' 'r')
    yield file.read if block_given?
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split.count} words" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
