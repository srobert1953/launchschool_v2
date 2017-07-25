# cute_angles.rb
MINUTES = 60
SECONDS = 60
DEGREE = "°"

def dms(angle)
  degrees, minutes = angle.divmod(1)
  minutes *= MINUTES
  minutes, seconds = minutes.divmod(1)
  seconds *= SECONDS
  format("%d#{DEGREE}%02d'%02d\"", degrees, minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
puts dms(254.6) #== %(254°36'00")
p dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
p dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")
