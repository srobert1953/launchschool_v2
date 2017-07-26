# madlibs.rb

print "Enter a noun: "
noun = gets.chomp
print "Enter a verb: "
verb = gets.chomp
print "Enter an adjective: "
adjective = gets.chomp
print "Enter an adverb: "
adverb = gets.chomp

puts ""
sentence_1 = "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
sentence_2 = "The #{adjective} #{noun} #{verb}s #{adverb} over the lazy dog."
sentence_3 = "The #{noun} #{adverb} #{verb}s up #{adjective} Joe's turtle."

puts [sentence_1, sentence_2, sentence_3].sample
