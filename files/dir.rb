Dir.mkdir("../directories") unless Dir.exist? "../directories"
Dir.chdir("../directories") do
  File.open("file_1.txt", 'w')
  File.open("file_2.txt", 'w')
  File.open("file_3.jpg", 'w')
  File.open("file_4.jpg", 'w')
end

directorie = Dir.new('../directories')

while file = directorie.read do
  puts "File #{file} has extension #{File.extname(file)}"
end

Dir["../directories/*.jpg"].each { |file| puts file }
