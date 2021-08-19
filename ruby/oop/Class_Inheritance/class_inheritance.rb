require 'byebug'
# Employee class with basic info(name, title, salary, boss)
class Employee
    attr_reader :name, :title, :salary, :boss
    def initialize(name, salary, title, boss)
        @name, @salary, @title, @boss = name, salary, title, boss
    end

    def bonus(multiplier)
        total_bonus = salary * multiplier
        total_bonus
    end
end

# Manager class includes array of all Employees assigned
class Manager < Employee
    attr_reader :name, :title, :salary, :boss
    attr_accessor :employees_assigned
    def initialize(name, salary, title, boss, employees_assigned)
        super(name, salary, title, boss)
        @employees_assigned = employees_assigned
    end

    def bonus(multiplier)
        sub_employee_total = @employees_assigned.inject(0) {|sum, e| sum += e.salary}
        total_bonus = sub_employee_total * multiplier
        total_bonus
    end
end

ned = Employee.new('Ned', 1000000, 'Founder', nil)
darren = Manager.new('Darren', 78000, 'TA Manager', 'Ned', [])
shawna = Employee.new('Shawna', 12000, 'TA', 'Darren')
david = Employee.new('David', 10000, 'TA', 'Darren')
darren.employees_assigned = [shawna, david]

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000