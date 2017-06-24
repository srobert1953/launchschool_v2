# low_medium_or_high.rb

numbers = {
            high:   100,
            medium: 50,
            low:    10
          }

low_numbers = numbers.select { |key, value| value < 25 }
p low_numbers
