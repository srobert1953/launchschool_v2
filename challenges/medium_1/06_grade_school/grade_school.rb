# grade_shool.rb

class School
  def initialize
    @roster = Hash.new { |roster, grade| roster[grade] = [] }
  end

  def add(name, grade)
    @roster[grade] << name
  end

  def to_h
    @roster.sort.map { |grades, names| [grades, names.sort] }.to_h
  end

  def grade(number)
    @roster[number]
  end
end
