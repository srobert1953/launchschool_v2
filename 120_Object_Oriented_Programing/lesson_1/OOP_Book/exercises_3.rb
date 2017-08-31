class Student
  attr_accessor :name

  def initialize(name, grade)
    self.name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    self.grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

me = Student.new('Robert', 99)
billy = Student.new('Billy', 97)

puts "Well done" if me.better_grade_than?(billy)
