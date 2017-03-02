require "active_record"
require_relative 'employee'
require_relative 'db_connection'
require 'pry'

class Department < ActiveRecord::Base

  def add_employee(employee)
    employee.department_id = self.id
    employee.save
  end

  def staff
    Employee.where(department_id: self.id)
  end

  def total_department_payroll(employees)
    staff.reduce(0.0) {|sum, e| sum + e.salary}
  end

  def give_raises_to_all_good_workers(total_amount_to_give)
    employees_for_raises = self.staff.select do |el|
    el.determine_if_satisfactory == "Satisfactory"
    end
    amount_each = total_amount_to_give/employees_for_raises.length
    employees_for_raises.each do |el|
    el.change_salary(amount_each)
    end
end


end
