module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

class Sauce < HotSauce; end

p Sauce.ancestors
p HotSauce.ancestors
p Taste.ancestors
