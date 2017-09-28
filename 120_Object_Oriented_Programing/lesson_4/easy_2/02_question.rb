class Oracle
  def predict_the_future
    "You will " + choises.sample
  end

  def choises
    ["eat a nice lunch", "get a coffee", "sleep soon"]
  end
end

class RoadTrip < Oracle
  def choises
    ["visit London", "visit Paris", "travel around the world"]
  end
end

magic = RoadTrip.new
p magic.predict_the_future
p magic.predict_the_future
p magic.predict_the_future
