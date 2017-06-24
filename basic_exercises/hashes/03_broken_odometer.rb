# broken_odometer.rb

car = { type: "sedan",
        color: "blue",
        mileage: 80_000,
        year: 2003
      }

car.delete :mileage

p car
