class Classroom
  attr_accessor :lable
  attr_reader :students

  def initialize(lable)
    @lable = lable
    @students = []
  end

  def add_students(student)
    @students.push(student)
    student.classroom = self
  end
end
