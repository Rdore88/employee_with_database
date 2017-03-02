require "active_record"
require_relative 'employee'
require_relative 'db_connection'

class Department < ActiveRecord::Base

  def add_employee(employee)
    Employee.first.department_id=Department.first.id
    Employee.first.save
  end

  def total_department_payroll(employees)
    Department.where(self.id = employees.department_id)

  end
end
