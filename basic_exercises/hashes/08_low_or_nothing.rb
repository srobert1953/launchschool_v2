# low_or_nothing.rb

numbers = {
            high:   100,
            medium: 50,
            low:    10
          }

numbers.select! { |key, value| value < 25 }
p numbers
