class Student
  def initialize(name, year)
    @name = name
    @year = year
  end

  def to_s
    "#{@name}, graduate of #{@year}"
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end

  def to_s
    super() + " and could park!"
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super
  end
end

grad = Graduate.new('Robert', 2017, true)
puts grad
