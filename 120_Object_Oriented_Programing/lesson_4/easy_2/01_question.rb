class Oracle
  def predict_the_future
    "You will " + choise.sample
  end

  def choise
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

prediction = Oracle.new
p prediction.predict_the_future
p prediction.predict_the_future
p prediction.predict_the_future
p prediction.predict_the_future
