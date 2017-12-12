require_relative 'employee'

class Manager < Employee
  attr_accessor :name, :title, :salary, :boss, :employees
  def initialize(name, title, salary, boss, employees = [])
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    total_salary_of_subemployees = 0
    @employees.each {|emp| total_salary_of_subemployees += emp.salary }
    total_salary_of_subemployees * multiplier
  end
end
