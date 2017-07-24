# after_midnight_3.rb

MINUTES_IN_HOUR = 60
HOURS_IN_DAY = 24
MINUTES_IN_DAY = HOURS_IN_DAY * MINUTES_IN_HOUR

def after_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  ((hours * MINUTES_IN_HOUR) + minutes) % MINUTES_IN_DAY
end

def before_midnight(time)
  # hours, minutes = time.split(":").map(&:to_i)
  # hours == 0 ? 0 : MINUTES_IN_DAY - ((hours * MINUTES_IN_HOUR) + minutes)

  time = MINUTES_IN_DAY - after_midnight(time)
  time = 0 if time == MINUTES_IN_DAY
  time
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
