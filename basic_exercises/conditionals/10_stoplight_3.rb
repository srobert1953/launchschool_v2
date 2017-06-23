# stoplight_3.rb

stoplight = ['green', 'yellow', 'red'].sample

puts case stoplight
when 'green'  then  "Go!"
when 'yellow' then  "Slow down!"
else                "Stop"
end
